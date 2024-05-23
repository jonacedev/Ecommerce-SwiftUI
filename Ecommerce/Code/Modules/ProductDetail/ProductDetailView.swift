
import SwiftUI

struct ProductDetailView: View {
    
    @StateObject var viewModel: ProductDetailViewModel
    @ObservedObject var productsData = ProductsData.shared
    
    @State var amountItems: Int = 1
    @State var finalPrice: Double = 0
    @State var sizeSelected: ClotheSize = .s

    var body: some View {
        BaseView(content: content, vm: viewModel)
            .toolbar(.hidden, for: .navigationBar)
    }

    @ViewBuilder private func content() -> some View {
        
        ScrollView {
            ZStack(alignment: .topTrailing) {
                VStack(alignment: .leading) {
                    
                    Image(viewModel.product?.imageName ?? "")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity, maxHeight: 430)
                        .clipShape(RoundedCorner(radius: 20))
                        
                    VStack(alignment: .leading, spacing: 5) {
                        
                        vwTitle()
                        vwRatingReviews()
                       
                        Text(viewModel.product?.description ?? "")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                        
                        vwSizeSelection()
                    }
                    .padding(.top, 10)
                    
                    let btnText = "product_detail_add_to_cart".localized + String.convertDoubleToString(finalPrice) + "€"
                    BaseButton(style: .primary, text: btnText, action: {
                        
                        let newProduct = ProductCartModel(productId: viewModel.product?.id ?? 0, finalPrice: finalPrice, amount: amountItems, sizeSelected: sizeSelected)
                        productsData.addProductToCart(product: newProduct)
                        
                        viewModel.showCartSuccessAlert()
                    })
                    .clipShape(Capsule())
                    .padding(.top, 20)
                }
                .padding(.horizontal, 20)
                .padding(.top, 10)
                .padding(.bottom, 30)
                
                BaseTopBar(model: BaseTopBar.Model(text: "", back: {
                    viewModel.goBack()
                }))
                .padding(.leading, 20)
                .padding(.top, 20)
                
                IconButton(image: viewModel.product?.isFavorite == true ? "heart_fill" : "heart" , size: .big, backgroundColor: .white, iconColor: .primaryApp, isCircular: true, action: {
                    
                    viewModel.product?.isFavorite.toggle()
                    if let idx = productsData.products.first(where: { $0.id == viewModel.product?.id })?.id {
                        productsData.products[idx].isFavorite.toggle()
                    }
                })
                .padding(.top, 20)
                .padding(.trailing, 30)
            }
            .onAppear {
                finalPrice = viewModel.product?.price ?? 0
            }
        }
        .scrollIndicators(.hidden)
       
    }
    
    @ViewBuilder private func vwTitle() -> some View {
        HStack(alignment: .top, spacing: 10) {
            
            Text(viewModel.product?.title ?? "")
                .font(.system(size: 24).bold())
            
            Spacer(minLength: 0)
            
            HStack(alignment: .center, spacing: 10) {
                
                IconButton(image: "minus", size: .small, isCircular: true, action: {
                    if amountItems > 1 {
                        amountItems -= 1
                        finalPrice -= viewModel.product?.price ?? 0
                    }
                })
                
                TextField("\(amountItems)", value: $amountItems, format: .number)
                    .frame(width: 10)
                    .disabled(true)
                
                IconButton(image: "plus", size: .small, isCircular: true, action: {
                    amountItems += 1
                    finalPrice += viewModel.product?.price ?? 0
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
                IconSizeButton(size: size, sizeSelected: $sizeSelected)
            }
        }
    }
}

#Preview {
    ProductDetailWireframe(navigationManager: nil, product: nil).preview()
}
