
import SwiftUI
import SwiftData

struct CheckoutView: View {
    
    @StateObject var viewModel: CheckoutViewModel
    @State var shippingFee: Double = 3.99
    @State var itemSelected: String? = "checkout_visa_default".localized
    
    var body: some View {
        BaseView(content: content)
    }
    
    @ViewBuilder private func content() -> some View {
        VStack {
            List {
                if !viewModel.products.isEmpty {
                    
                    ForEach(viewModel.products) { product in
                        CheckoutCell(product: product, updateProduct: { newPrice, newItemsAmount in
                            viewModel.shoppingCartManager.updateProductCart(id: product.detail?.id, newPrice: newPrice, newItemsAmount: newItemsAmount)
                        })
                        .onTapGesture {
                            viewModel.goDetail(product: product.detail)
                        }
                        .listRowSeparator(.hidden)
                    }
                    .onDelete(perform: viewModel.shoppingCartManager.removeProduct)
                    
                    vwCheckoutDetails()
                    
                    BaseButton(style: .primary, text: "checkout_pay_btn".localized, action: {
                        viewModel.submitCart()
                    })
                    .listRowSeparator(.hidden)
                    .clipShape(Capsule())
                    .buttonStyle(.plain)
                    .padding(.top, 20)
                    .padding(.bottom, 70)
                    
                } else {
                    vwNoResults()
                }
            }
            .listRowBackground(Color.clear)
            .listStyle(.plain)
            .padding(.top, 20)
        }
    }
    
    @ViewBuilder private func vwCheckoutDetails() -> some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("checkout_shipping_info".localized)
                .font(.system(size: 18).bold())
                .padding(.top, 10)
            
            BaseDropDown(
                selection: $itemSelected,
                options: [
                    "checkout_visa_default".localized,
                    "checkout_visa_default2".localized
                ]
            )
            
            Group {
                let finalPrice = viewModel.products.compactMap{$0.finalPrice}.reduce(0, +)
                let subTotal = finalPrice + shippingFee
                
                HStack {
                    Text("Total (\(viewModel.products.count) items)")
                        .font(.subheadline)
                    Spacer()
                    Text(String.convertDoubleToString(finalPrice) + "euro_symbol".localized)
                        .font(.subheadline)
                }
                
                HStack {
                    Text("checkout_shipping_fee".localized)
                        .font(.subheadline)
                    Spacer()
                    Text(String.convertDoubleToString(shippingFee) + "euro_symbol".localized)
                        .font(.subheadline)
                }
                
                VStack {
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(Color.gray)
                }
                
                HStack {
                    Text("checkout_sub_total".localized)
                        .font(.headline)
                    Spacer()
                    Text(String.convertDoubleToString(subTotal) + "euro_symbol".localized)
                        .font(.headline)
                }
            }
        }
    }
    
    @ViewBuilder private func vwNoResults() -> some View {
        HStack() {
            Text("checkout_empty_cart".localized)
                .foregroundStyle(.white)
                .font(.subheadline)
                .padding(25)
        }
        .listRowSeparator(.hidden)
        .frame(maxWidth: .infinity)
        .background(Color.primaryApp.opacity(0.95))
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .padding(.top, 20)
    }
}

#Preview {
    CheckoutWireframe(navigationManager: NavigationManager(), rootManager: RootManager(), shoppingCartManager: ShoppingCartManager()).view
}
