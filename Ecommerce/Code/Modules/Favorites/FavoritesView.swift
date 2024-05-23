
import SwiftUI

struct FavoritesView: View {
    
    @StateObject var viewModel: FavoritesViewModel
    @ObservedObject var productsData = ProductsData.shared
    
    var body: some View {
        BaseView(content: content, vm: viewModel)
    }

    @ViewBuilder private func content() -> some View {
        ScrollView {
            if !productsData.favoritesProducts().isEmpty {
                LazyVGrid(columns: [GridItem(.fixed(170)), GridItem(.fixed(170))]) {
                    ForEach(0..<productsData.favoritesProducts().count, id: \.self) { index in
                        HomeGridCell(product: productsData.favoritesProducts()[index], favoritePressed: { favorite in
                            removeFromFavorites(favIndex: index)
                       })
                       .onTapGesture {
                           let product = productsData.favoritesProducts()[index]
                           viewModel.goDetail(product: product)
                       }
                   }
               }
                .padding(.bottom, 70)
            } else {
                vwNoResults()
            }
           
       }
        .scrollIndicators(.hidden)
        .padding(.horizontal, 20)
        .padding(.top, 20)
    }
    
    @ViewBuilder private func vwNoResults() -> some View {
        HStack() {
            Text("favorites_empty_list".localized)
                .foregroundStyle(.white)
                .font(.subheadline)
                .padding(25)
        }
        .listRowSeparator(.hidden)
        .frame(maxWidth: .infinity)
        .background(Color.primaryApp.opacity(0.95))
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .padding(.top, 30)
    }
    
    func removeFromFavorites(favIndex: Int) {
        if let idx = productsData.products.firstIndex(where: { $0.id == productsData.favoritesProducts()[favIndex].id }) {
            productsData.products[idx].isFavorite = false
        }
    }
}

#Preview {
    FavoritesWireframe(navigationManager: nil).preview()
}
