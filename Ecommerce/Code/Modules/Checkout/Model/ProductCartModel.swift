//
//  ProductModel.swift
//  Ecommerce
//
//  Created by Jonathan Miguel Onrubia Solis on 4/4/24.
//

import Foundation

struct ProductCartModel: Hashable {
    var id: Int
    var finalPrice: Double
    var amount: Int
    var sizeSelected: ClotheSize
    
    init(productId: Int, finalPrice: Double, amount: Int, sizeSelected: ClotheSize) {
        self.id = productId
        self.finalPrice = finalPrice
        self.amount = amount
        self.sizeSelected = sizeSelected
    }
}

