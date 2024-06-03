
import SwiftUI
import SDWebImageSwiftUI

struct ProductDetailView: View {
    
    @StateObject var viewModel: ProductDetailViewModel
   
    var body: some View {
        BaseView(content: content)
            .toolbar(.hidden, for: .navigationBar)
    }
    
    @ViewBuilder private func content() -> some View {
        
        ScrollView {
            ZStack(alignment: .topTrailing) {
                VStack(alignment: .leading) {
                    productImage()
                    productDetails()
                }
                .padding(.horizontal, 20)
                .padding(.top, 10)
                .padding(.bottom, 30)
                
                BaseTopBar(model: BaseTopBar.Model(text: "", back: {
                    viewModel.goBack()
                }))
                .padding(.leading, 20)
                .padding(.top, 20)
                
                IconButton(image: viewModel.productIsFavorite() ? "heart_fill" : "heart" , size: .big, backgroundColor: .white, iconColor: .primaryApp, isCircular: true, action: {
                    viewModel.tapFavorite()
                })
                .padding(.top, 20)
                .padding(.trailing, 30)
            }
        }
        .onAppear {
            viewModel.getFavoritesList()
        }
        .scrollIndicators(.hidden)
        
    }
    
    @ViewBuilder private func productImage() -> some View {
        WebImage(url: URL(string: viewModel.product?.image ?? "")) { image in
                image.resizable()
            } placeholder: {
                Rectangle().foregroundColor(.gray)
            }
            .indicator(.activity)
            .transition(.fade(duration: 0.3))
            .scaledToFill()
            .frame(maxWidth: .infinity, maxHeight: 430)
            .clipShape(RoundedCorner(radius: 20))
    }
    
    @ViewBuilder private func productDetails() -> some View {
        VStack(alignment: .leading, spacing: 5) {
            vwTitle()
            vwRatingReviews()
            
            Text(viewModel.product?.description ?? "")
                .font(.subheadline)
                .foregroundStyle(.gray)
            vwSizeSelection()
            
            BaseButton(style: .primary, text: "product_detail_add_to_cart".localized + String.convertDoubleToString(viewModel.finalPrice) + "€", action: {
                viewModel.addProductToCart()
            })
            .clipShape(Capsule())
            .padding(.top, 20)
        }
    }
    
    @ViewBuilder private func vwTitle() -> some View {
        HStack(alignment: .top, spacing: 10) {
            
            Text(viewModel.product?.title ?? "")
                .font(.system(size: 24).bold())
            
            Spacer(minLength: 0)
            
            HStack(alignment: .center, spacing: 10) {
                
                IconButton(image: "minus", size: .small, isCircular: true, action: {
                    viewModel.decrementAmount()
                })
                
                TextField("\(viewModel.amountItems)", value: $viewModel.amountItems, format: .number)
                    .frame(width: 10)
                    .disabled(true)
                
                IconButton(image: "plus", size: .small, isCircular: true, action: {
                    viewModel.incrementAmount()
                })
            }
            
        }
    }
    
    @ViewBuilder private func vwRatingReviews() -> some View {
        HStack {
            if let rating = viewModel.product?.rating, rating > 0 {
                ForEach(0..<5) { index in
                    Image(index < rating ? "star_fill" : "star")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
            }
            
            Text("| \(viewModel.product?.reviews ?? 0) " +  "product_detail_reviews_text".localized)
                .font(.system(size: 14).bold())
                .foregroundStyle(Color.primaryApp)
        }
    }
    
    
    @ViewBuilder private func vwSizeSelection() -> some View {
        Text("product_detail_choose_size".localized)
            .font(.system(size: 16).bold())
            .foregroundStyle(Color.primaryApp)
            .padding(.vertical, 10)
        
        HStack {
            ForEach(ClotheSize.allCases, id:  \.self) { size in
                IconSizeButton(size: size, sizeSelected: $viewModel.sizeSelected)
            }
        }
    }
}

#Preview {
    ProductDetailWireframe(navigationManager: NavigationManager(), shoppingCartManager: ShoppingCartManager(), product: nil).preview()
}
