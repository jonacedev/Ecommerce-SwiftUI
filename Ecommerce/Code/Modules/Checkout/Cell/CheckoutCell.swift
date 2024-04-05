//
//  CheckoutCell.swift
//  Ecommerce
//
//  Created by Jonathan Miguel Onrubia Solis on 4/4/24.
//

import SwiftUI

struct CheckoutCell: View {
    
    @ObservedObject var productsData = ProductsData.shared
    var product: ProductCartModel
    @State var amountItems: Int = 1
    @State var finalPrice: Double = 0
    
    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            
            Image(productsData.products[product.id].imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 110, height: 110)
                .clipShape(RoundedRectangle(cornerRadius: 16))
            
            VStack(alignment: .leading, spacing: 5) {
                
                Text(productsData.products[product.id].title)
                    .font(.system(size: 18).bold())
                
                Text(productsData.products[product.id].subTitle)
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                
                Text("Size:" + " \(product.sizeSelected)".capitalized)
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                
                
                HStack(alignment: .center, spacing: 10) {
                    
                    Text("\(finalPrice.formatted())€")
                        .font(.system(size: 17).bold())
                        .padding(.top, 10)
                    
                    Spacer(minLength: 0)
                    
                    IconButton(image: "minus", size: .small, isCircular: true, action: {
                        if amountItems > 1 {
                            amountItems -= 1
                            finalPrice -= productsData.products[product.id].price
                        }
                    })
                    .buttonStyle(.plain)
                    
                    TextField("\(amountItems)", value: $amountItems, format: .number)
                        .frame(width: 10)
                        .disabled(true)
                    
                    IconButton(image: "plus", size: .small, isCircular: true, action: {
                        amountItems += 1
                        finalPrice += productsData.products[product.id].price
                    })
                    .buttonStyle(.plain)
                }
            }
        }
        .onAppear {
            finalPrice = product.finalPrice
            amountItems = product.amount
        }
        //.frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
}

#Preview {
    CheckoutCell(product: ProductCartModel(productId: 0, finalPrice: 212, amount: 2, sizeSelected: .s))
}
