
import SwiftUI

struct FavoritesView: View {
    
    @StateObject var viewModel: FavoritesViewModel
    @ObservedObject var productsData = ProductsData.shared
    
    var body: some View {
        BaseView(content: content, vm: viewModel)
    }

    @ViewBuilder private func content() -> some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.fixed(170)), GridItem(.fixed(170))]) {
                ForEach(0..<productsData.favoritesProducts().count, id: \.self) { index in
                    HomeGridCell(product: productsData.favoritesProducts()[index], favoritePressed: { favorite in
                        removeFromFavorites(favIndex: index)
                   })
                   .onTapGesture {
                       viewModel.goToDetail(product: productsData.favoritesProducts()[index])
                   }
               }
           }
            .padding(.bottom, 70)
       }
        .scrollIndicators(.hidden)
        .padding(.horizontal, 20)
        .padding(.top, 20)
    }
    
    func removeFromFavorites(favIndex: Int) {
        if let idx = productsData.products.firstIndex(where: { $0.id == productsData.favoritesProducts()[favIndex].id }) {
            productsData.products[idx].isFavorite = false
        }
    }
}

#Preview {
    FavoritesWireframe(navigator: nil).preview()
}
