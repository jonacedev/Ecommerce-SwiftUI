//
//  HomeGridCell.swift
//  Ecommerce
//
//  Created by Jonathan Miguel Onrubia Solis on 2/4/24.
//

import SwiftUI

struct HomeGridCell: View {
    var product: ProductModel
    var favoritePressed: (Bool) -> Void
    var body: some View {
        ZStack(alignment: .topTrailing) {
           
            VStack(alignment: .leading) {
                Image(product.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 170, height: 220)
                    .clipShape(RoundedCorner(radius: 20))
               
                Text(product.title)
                    .font(.subheadline.bold())
                    .padding(.top, 5)
                Text(product.subTitle)
                    .font(.subheadline)
                    .foregroundStyle(.gray)
             
                Text("\(product.price.formatted())€")
                    .font(.headline.bold())
                    .padding(.top, 1)
                    .padding(.bottom, 10)
            }
            
            IconButton(image: product.isFavorite ? "heart_fill" : "heart" , size: .small, isCircular: true, action: {
                favoritePressed(!product.isFavorite)
            })
            .padding(.top, 10)
            .padding(.trailing, 10)
        }
    }
}

#Preview {
    HomeGridCell(product: ProductsData.shared.products.first!, favoritePressed: { _ in })
}
