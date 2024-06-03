//
//  CheckoutCell.swift
//  Ecommerce
//
//  Created by Jonathan Miguel Onrubia Solis on 4/4/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct CheckoutCell: View {

    var product: ProductCartModel
    @State var amountItems: Int = 1
    @State var finalPrice: Double = 0
    var updateProduct: (Double, Int) -> Void

    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            
            WebImage(url: URL(string: product.detail?.image ?? "")) { image in
                    image.resizable()
                } placeholder: {
                    Rectangle().foregroundColor(.gray)
                }
                .indicator(.activity)
                .transition(.fade(duration: 0.3))
                .aspectRatio(contentMode: .fill)
                .frame(width: 110, height: 110)
                .clipShape(RoundedRectangle(cornerRadius: 16))

            VStack(alignment: .leading, spacing: 5) {

                Text(product.detail?.title ?? "")
                    .font(.system(size: 18).bold())

                Text(product.detail?.subTitle ?? "")
                    .font(.subheadline)
                    .foregroundStyle(.gray)

                Text("checkout_size_title".localized + " \(product.sizeSelected)".capitalized)
                    .font(.subheadline)
                    .foregroundStyle(.gray)


                HStack(alignment: .center, spacing: 10) {

                    Text(String.convertDoubleToString(finalPrice) + "euro_symbol".localized)
                        .font(.system(size: 17).bold())
                        .padding(.top, 10)

                    Spacer(minLength: 0)

                    IconButton(image: "minus", size: .small, isCircular: true, action: {
                        if amountItems > 1 {
                            amountItems -= 1
                            finalPrice -= product.detail?.price ?? 0
                            updateProduct(finalPrice, amountItems)
                        }
                    })
                    .buttonStyle(.plain)

                    TextField("\(amountItems)", value: $amountItems, format: .number)
                        .frame(width: 10)
                        .disabled(true)

                    IconButton(image: "plus", size: .small, isCircular: true, action: {
                        amountItems += 1
                        finalPrice += product.detail?.price ?? 0
                        updateProduct(finalPrice, amountItems)
                    })
                    .buttonStyle(.plain)
                }
            }
        }
        .onAppear {
            finalPrice = product.finalPrice
            amountItems = product.amount
        }

    }
}

#Preview {
    CheckoutCell(product: ProductCartModel(finalPrice: 212, amount: 2, sizeSelected: .s, productDetail: Product()), updateProduct: { _,_ in })
}
