
import SwiftUI

struct ProductDetailView: View {
    
    @StateObject var viewModel: ProductDetailViewModel
    @State var itemsSelected: Double = 0

    var body: some View {
        BaseView(content: content, vm: viewModel)
    }

    @ViewBuilder private func content() -> some View {
        
        ZStack(alignment: .topTrailing) {
            VStack(alignment: .leading) {
                
                Image(viewModel.product?.imageName ?? "")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: 450)
                    .clipShape(RoundedCorner(radius: 20))
                    
                VStack(alignment: .leading, spacing: 5) {
                    
                    HStack(alignment: .top, spacing: 20) {
                        
                        Text(viewModel.product?.title ?? "")
                            .font(.system(size: 25).bold())
                        
                        HStack(alignment: .center) {
                            
                            IconButton(image: "minus", isCircular: true, action: {
                                if itemsSelected > 0 {
                                    itemsSelected -= 1
                                }
                            })
                            
                            TextField("\(itemsSelected)", value: $itemsSelected, format: .number)
                                .frame(width: 10)
                            
                            IconButton(image: "plus", isCircular: true, action: {
                                itemsSelected += 1
                            })
                        }
                    }
                    
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
                    
                    Text(viewModel.product?.description ?? "")
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                }
                .padding(.top, 10)
                
                BaseButton(style: .primary, text: "Add to cart | \(viewModel.product?.price ?? "")", action: {
                    
                })
                .clipShape(RoundedRectangle(cornerRadius: 40))
                .padding(.top, 20)
             
                Spacer()
                   
            }
            .padding(.horizontal, 20)
            .padding(.top, 10)
            
            BaseTopBar(model: BaseTopBar.Model(text: "", back: {
                viewModel.goBack()
            }))
            .padding(.leading, 20)
            .padding(.top, 20)
            
            IconButton(image: viewModel.product?.isFavorite == true ? "heart_fill" : "heart" , size: .big, backgroundColor: .white, iconColor: .primaryApp, isCircular: true, action: {
                viewModel.product?.isFavorite = !(viewModel.product?.isFavorite ?? false)
                //favoritePressed(!product.isFavorite)
            })
            .padding(.top, 20)
            .padding(.trailing, 30)
        }
       
    }
}

#Preview {
    let productDetailWireframe = ProductDetailWireframe(navigator: nil)
    productDetailWireframe.product = ProductModel.getProducts().first
    return productDetailWireframe.preview()
}
