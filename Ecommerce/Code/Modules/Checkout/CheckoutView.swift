
import SwiftUI

struct CheckoutView: View {
    
    @StateObject var viewModel: CheckoutViewModel
    
    var body: some View {
        BaseView(content: content, vm: viewModel)
    }

    @ViewBuilder private func content() -> some View {
        Text("Checkout")
    }
}

#Preview {
    CheckoutWireframe(navigator: nil).preview()
}
