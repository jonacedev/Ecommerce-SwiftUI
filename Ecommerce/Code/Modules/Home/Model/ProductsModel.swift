//
//  ProductModel.swift
//  Ecommerce
//
//  Created by Jonathan Miguel Onrubia Solis on 2/4/24.
//

import Foundation

struct ProductsModel: Decodable {
    let success: Bool?
    let products: [Product]?
}

struct Product: Decodable, Hashable {
    var id: String?
    var title: String?
    var subTitle: String?
    var description: String?
    var price: Double?
    var rating: Int?
    var reviews: Int?
    var image: String?
}

