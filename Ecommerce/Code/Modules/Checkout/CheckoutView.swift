
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
                ForEach(productsData.productsCart, id: \.self) { product in
                    CheckoutCell(product: product)
                        .listRowSeparator(.hidden)
                }
                .onDelete(perform: deleteItem)
                
                if !productsData.productsCart.isEmpty {
                    BaseButton(style: .primary, text: "Pay", action: {
                       
                    })
                    .clipShape(Capsule())
                    .listRowSeparator(.hidden)
                    .buttonStyle(.plain)
                    .padding(.top, 20)
                    .padding(.bottom, 70)
                }
            }
          
            .listRowBackground(Color.clear)
            .listStyle(.plain)
            .padding(.top, 20)
        }
    }
    
    func deleteItem(at offsets: IndexSet) {
        productsData.productsCart.remove(atOffsets: offsets)
    }
}

#Preview {
    CheckoutWireframe(navigator: nil).preview()
}
