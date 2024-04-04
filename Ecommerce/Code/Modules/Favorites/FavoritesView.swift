
import SwiftUI

struct FavoritesView: View {
    
    @StateObject var viewModel: FavoritesViewModel
    
    var body: some View {
        BaseView(content: content, vm: viewModel)
    }

    @ViewBuilder private func content() -> some View {
        Text("Favorites")
    }
}

#Preview {
    FavoritesWireframe(navigator: nil).preview()
}
