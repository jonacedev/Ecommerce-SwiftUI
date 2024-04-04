
import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel: HomeViewModel
    @State var text: String = ""
    @State var products: [ProductModel] = ProductModel.getProducts()
    
    var body: some View {
        BaseView(content: content, vm: viewModel)
    }

    @ViewBuilder private func content() -> some View {
        VStack {
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
            
            VStack {
                HStack(spacing: 10) {
                    CustomSearchBar(text: $text, placeholder: "searchbar_placeholder".localized)
                    IconButton(image: "filter", size: .big, action: { })
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.fixed(170)), GridItem(.fixed(170))]) {
                   ForEach(0..<products.count, id: \.self) { index in
                       HomeGridCell(product: products[index], favoritePressed: { favorite in
                           products[index].isFavorite = favorite
                       })
                       .onTapGesture {
                           viewModel.goToDetail(product: products[index])
                       }
                   }
               }
           }
            .scrollIndicators(.hidden)
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    HomeWireframe(navigator: nil).preview()
}
