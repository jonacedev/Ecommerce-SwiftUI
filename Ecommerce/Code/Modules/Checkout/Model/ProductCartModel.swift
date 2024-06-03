//
//  ProductModel.swift
//  Ecommerce
//
//  Created by Jonathan Miguel Onrubia Solis on 4/4/24.
//

import Foundation

class ProductCartModel: Identifiable {
    var id = UUID()
    var finalPrice: Double
    var amount: Int
    var sizeSelected: ClotheSize
    var detail: Product?
    
    init(finalPrice: Double, amount: Int, sizeSelected: ClotheSize, productDetail: Product?) {
        self.finalPrice = finalPrice
        self.amount = amount
        self.sizeSelected = sizeSelected
        self.detail = productDetail
    }
}

