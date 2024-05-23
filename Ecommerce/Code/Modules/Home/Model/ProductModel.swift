//
//  ProductModel.swift
//  Ecommerce
//
//  Created by Jonathan Miguel Onrubia Solis on 2/4/24.
//

import Foundation

struct ProductModel: Hashable {
    var id: Int
    var imageName: String
    var title: String
    var subTitle: String
    var price: Double
    var isFavorite: Bool
    var description: String
    var rating: Int
    var reviews: Int
}

