
import SwiftUI

struct CheckoutView: View {
    
    @StateObject var viewModel: CheckoutViewModel
    @ObservedObject var productsData = ProductsData.shared
    
    
    var body: some View {
        BaseView(content: content, vm: viewModel)
    }
    
    @ViewBuilder private func content() -> some View {
        VStack {
            BaseButton(style: .primary, text: "Pay", action: {
                
            })
            .clipShape(RoundedRectangle(cornerRadius: 40))
            .padding(20)
        
            List {
                ForEach(productsData.productsCart, id: \.self) { product in
                    CheckoutCell(product: product)
                        .padding(.bottom, 10)
                }
                .onDelete(perform: deleteItem) // Add delete functionality
            }
            .listStyle(.plain)
            
            Spacer()
        }
    }
    
    func deleteItem(at offsets: IndexSet) {
        productsData.productsCart.remove(atOffsets: offsets)
    }
}

#Preview {
    CheckoutWireframe(navigator: nil).preview()
}
