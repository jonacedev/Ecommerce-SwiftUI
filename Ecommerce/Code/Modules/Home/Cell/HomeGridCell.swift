//
//  HomeGridCell.swift
//  Ecommerce
//
//  Created by Jonathan Miguel Onrubia Solis on 2/4/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct HomeGridCell: View {
    var product: Product
    var isFavorite: Bool
    var favoritePressed: () -> Void
    var body: some View {
        ZStack(alignment: .topTrailing) {
           
            VStack(alignment: .leading) {
                WebImage(url: URL(string: product.image ?? "")) { image in
                        image.resizable()
                    } placeholder: {
                        Rectangle().foregroundColor(.gray)
                    }
                    .retryOnAppear(true)
                    .indicator(.activity)
                    .transition(.fade(duration: 0.3))
                    .scaledToFill()
                    .frame(width: 170, height: 220)
                    .clipShape(RoundedCorner(radius: 20))
               
                Text(product.title ?? "")
                    .font(.subheadline.bold())
                    .padding(.top, 5)
                Text(product.subTitle ?? "")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
             
                Text(String.convertDoubleToString(product.price) + "euro_symbol".localized)
                    .font(.headline.bold())
                    .padding(.top, 1)
                    .padding(.bottom, 10)
            }
            
            IconButton(image: isFavorite ? "heart_fill" : "heart" , size: .small, isCircular: true, action: {
                favoritePressed()
            })
            .padding(.top, 10)
            .padding(.trailing, 10)
        }
    }
}

#Preview {
    HomeGridCell(product: Product(), isFavorite: true, favoritePressed: { })
}
