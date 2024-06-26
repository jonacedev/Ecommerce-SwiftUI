
import SwiftUI
import SDWebImageSwiftUI

struct HomeView: View {
    
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        BaseView(content: content)
    }
    
    @ViewBuilder private func content() -> some View {
        VStack {
            vwHeader()
            
            VStack {
                HStack(spacing: 10) {
                    CustomSearchBar(text: $viewModel.searchText, placeholder: "searchbar_placeholder".localized)
                    IconButton(image: "filter", size: .big, action: { })
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 30)
            
            vwList()
        }
        .onAppear {
            viewModel.loadAllData()
        }
    }
    
    @ViewBuilder private func vwHeader() -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text("greeting_title".localized)
                Text(viewModel.user?.username ?? "")
                    .font(.headline)
            }
            Spacer()
            WebImage(url: URL(string: viewModel.user?.profileImage ?? "")) { image in
                    image.resizable()
                } placeholder: {
                    Rectangle().foregroundColor(.gray)
                }
                .retryOnAppear(true)
                .indicator(.activity)
                .transition(.fade(duration: 0.3))
                .scaledToFit()
                .clipShape(Circle())
                .frame(width: 70, height: 70)
        }
        .padding(.horizontal, 20)
        .padding(.top, 10)
    }
    
    @ViewBuilder private func vwList() -> some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.fixed(170)), GridItem(.fixed(170))]) {
                ForEach(viewModel.filteredProducts(), id: \.id) { product in
                    HomeGridCell(product: product, isFavorite: viewModel.isFavorite(id: product.id), favoritePressed: {
                        viewModel.tapFavorite(id: product.id)
                    })
                    .onTapGesture {
                        viewModel.goDetail(product: product)
                    }
                }
            }
            .padding(.bottom, 70)
        }
        .scrollIndicators(.hidden)
        .padding(.horizontal, 20)
    }
}

#Preview {
    HomeWireframe(navigationManager: NavigationManager(), rootManager: RootManager()).view
}
