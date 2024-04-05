
import SwiftUI

struct CheckoutView: View {
    
    @StateObject var viewModel: CheckoutViewModel
    @ObservedObject var productsData = ProductsData.shared
    
    
    var body: some View {
        BaseView(content: content, vm: viewModel)
    }
    
    @ViewBuilder private func content() -> some View {
        VStack {
            List {
                if !productsData.productsCart.isEmpty {
                    
                    ForEach(productsData.productsCart, id: \.self) { product in
                        CheckoutCell(product: product, updateProduct: { newPrice, newItemsAmount in
                            productsData.updateProductCart(id: product.id, newPrice: newPrice, newItemsAmount: newItemsAmount)
                        })
                        .listRowSeparator(.hidden)
                    }
                    .onDelete(perform: deleteItem)
                    
                    vwCheckoutDetails()
                    
                    BaseButton(style: .primary, text: "Pay", action: {
                       
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
            Text("Shipping information")
                .font(.system(size: 18).bold())
                .padding(.top, 20)
            
            HStack() {
                Image("visa")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 25)
                    .padding(.vertical, 15)
                    .padding(.leading, 15)
                Text("**** **** **** 4137")
                
                Spacer()
                
                Image("arrow_down")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .padding(14)
            }
            .background(Color.gray.opacity(0.2))
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
            HStack {
                Text("Total (\(productsData.productsCart.count) items)")
                Spacer()
                Text(String.convertDoubleToString(productsData.productsCart.compactMap{$0.finalPrice}.reduce(0, +)) + "€")
                    .font(.headline)
            }
            
            HStack {
                Text("Shipping fee")
                Spacer()
                Text("0.0€")
                    .font(.headline)
            }
        }
    }
    
    @ViewBuilder private func vwNoResults() -> some View {
        HStack() {
            Text("There is still nothing in the cart")
                .padding()
        }
        .listRowSeparator(.hidden)
        .frame(maxWidth: .infinity)
        .background(Color.gray.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
    
    func deleteItem(at offsets: IndexSet) {
        productsData.productsCart.remove(atOffsets: offsets)
    }
}

#Preview {
    CheckoutWireframe(navigator: nil).preview()
}
