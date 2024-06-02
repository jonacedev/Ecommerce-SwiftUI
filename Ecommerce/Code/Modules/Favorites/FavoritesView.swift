
import SwiftUI

struct FavoritesView: View {
    
    @StateObject var viewModel: FavoritesViewModel
    
    var body: some View {
        BaseView(content: content)
    }

    @ViewBuilder private func content() -> some View {
        ScrollView {
            if !viewModel.favorites.isEmpty {
                LazyVGrid(columns: [GridItem(.fixed(170)), GridItem(.fixed(170))]) {
                    ForEach(viewModel.favorites, id: \.id) { product in
                        HomeGridCell(product: product, isFavorite: viewModel.isFavorite(id: product.id), favoritePressed: {
                            viewModel.tapFavorite(id: product.id)
                       })
                       .onTapGesture {
                           viewModel.goDetail(product: product)
                       }
                   }
               }
                .padding(.bottom, 70)
            } else {
                vwNoResults()
            }
           
       }
        .onAppear{
            viewModel.getFavoritesList()
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
}

#Preview {
    FavoritesWireframe(navigationManager: NavigationManager()).preview()
}
