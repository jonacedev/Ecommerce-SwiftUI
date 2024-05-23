
import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel: HomeViewModel
    @State var searchText: String = ""
    @ObservedObject var productsData = ProductsData.shared
    
    var body: some View {
        BaseView(content: content, vm: viewModel)
    }

    @ViewBuilder private func content() -> some View {
        VStack {
            vwHeader()
            
            VStack {
                HStack(spacing: 10) {
                    CustomSearchBar(text: $searchText, placeholder: "searchbar_placeholder".localized)
                    IconButton(image: "filter", size: .big, action: { })
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 30)
            
            vwList()
        }
    }
    
    @ViewBuilder private func vwHeader() -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text("greeting_title".localized)
                Text("default_name_title".localized)
                    .font(.headline)
            }
            Spacer()
            Image("profile")
                .resizable()
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
                ForEach(0..<filteredResults.count, id: \.self) { index in
                    HomeGridCell(product: filteredResults[index], favoritePressed: { favorite in
                        if let idx = productsData.products.firstIndex(where: { $0.id == filteredResults[index].id }) {
                            productsData.products[idx].isFavorite = favorite
                        }
                   })
                   .onTapGesture {
                       let product = filteredResults[index]
                       viewModel.goDetail(product: product)
                   }
               }
           }
            .padding(.bottom, 70)
       }
        .scrollIndicators(.hidden)
        .padding(.horizontal, 20)
    }
    
    
    var filteredResults: [ProductModel] {
        if searchText.isEmpty {
            return productsData.products
        } else {
            return productsData.products.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
}

#Preview {
    HomeWireframe(navigationManager: NavigationManager()).preview()
}
