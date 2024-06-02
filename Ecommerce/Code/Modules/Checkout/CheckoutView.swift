//
//import SwiftUI
//
//struct CheckoutView: View {
//    
//    @EnvironmentObject var parentViewModel: MainTabBarViewModel
//    @StateObject var viewModel: CheckoutViewModel
//    
//    @State var shippingFee: Double = 3.99
//    @State var itemSelected: String? = "checkout_visa_default".localized
//    
//    var body: some View {
//        BaseView(content: content, vm: viewModel)
//    }
//    
//    @ViewBuilder private func content() -> some View {
//        VStack {
//            List {
//                if !productsData.productsCart.isEmpty {
//                    
//                    ForEach(productsData.productsCart, id: \.self) { product in
//                        CheckoutCell(product: product, updateProduct: { newPrice, newItemsAmount in
//                            productsData.updateProductCart(id: product.id, newPrice: newPrice, newItemsAmount: newItemsAmount)
//                        })
//                        .onTapGesture {
//                            let product = productsData.products[product.id]
//                            viewModel.goDetail(product: product)
//                        }
//                        .listRowSeparator(.hidden)
//                    }
//                    .onDelete(perform: deleteItem)
//                    
//                    vwCheckoutDetails()
//                    
//                    BaseButton(style: .primary, text: "checkout_pay_btn".localized, action: {
//                        parentViewModel.loading = true
//                        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
//                            parentViewModel.loading = false
//                            productsData.productsCart.removeAll()
//                            successAlert()
//                        })
//                        
//                    })
//                    .listRowSeparator(.hidden)
//                    .clipShape(Capsule())
//                    .buttonStyle(.plain)
//                    .padding(.top, 20)
//                    .padding(.bottom, 70)
//                    
//                } else {
//                    vwNoResults()
//                }
//            }
//            .listRowBackground(Color.clear)
//            .listStyle(.plain)
//            .padding(.top, 20)
//        }
//    }
//    
//    @ViewBuilder private func vwCheckoutDetails() -> some View {
//        VStack(alignment: .leading, spacing: 20) {
//            Text("checkout_shipping_info".localized)
//                .font(.system(size: 18).bold())
//                .padding(.top, 10)
//            
//            BaseDropDown(
//                selection: $itemSelected,
//                options: [
//                    "checkout_visa_default".localized,
//                    "checkout_visa_default2".localized
//                ]
//            )
//            
//            Group {
//                let finalPrice = productsData.productsCart.compactMap{$0.finalPrice}.reduce(0, +)
//                let subTotal = finalPrice + shippingFee
//                
//                HStack {
//                    Text("Total (\(productsData.productsCart.count) items)")
//                        .font(.subheadline)
//                    Spacer()
//                    Text(String.convertDoubleToString(finalPrice) + "euro_symbol".localized)
//                        .font(.subheadline)
//                }
//                
//                HStack {
//                    Text("checkout_shipping_fee".localized)
//                        .font(.subheadline)
//                    Spacer()
//                    Text(String.convertDoubleToString(shippingFee) + "euro_symbol".localized)
//                        .font(.subheadline)
//                }
//                
//                VStack {
//                    Rectangle()
//                        .frame(height: 1)
//                        .foregroundColor(Color.gray)
//                }
//                
//                HStack {
//                    Text("checkout_sub_total".localized)
//                        .font(.headline)
//                    Spacer()
//                    Text(String.convertDoubleToString(subTotal) + "euro_symbol".localized)
//                        .font(.headline)
//                }
//            }
//        }
//    }
//    
//    @ViewBuilder private func vwNoResults() -> some View {
//        HStack() {
//            Text("checkout_empty_cart".localized)
//                .foregroundStyle(.white)
//                .font(.subheadline)
//                .padding(25)
//        }
//        .listRowSeparator(.hidden)
//        .frame(maxWidth: .infinity)
//        .background(Color.primaryApp.opacity(0.95))
//        .clipShape(RoundedRectangle(cornerRadius: 8))
//        .padding(.top, 20)
//    }
//    
//    func deleteItem(at offsets: IndexSet) {
//        productsData.productsCart.remove(atOffsets: offsets)
//    }
//    
//    func successAlert() {
//        parentViewModel.alert = BaseAlert.Model(description: "alert_success_order".localized, buttonText1: "alert_acept_title".localized, action1: {
//            parentViewModel.alert = nil
//        })
//    }
//}
//
//#Preview {
//    CheckoutWireframe(navigationManager: NavigationManager()).preview()
//}
