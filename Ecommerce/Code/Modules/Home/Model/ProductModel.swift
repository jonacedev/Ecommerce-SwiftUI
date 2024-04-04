//
//  ProductModel.swift
//  Ecommerce
//
//  Created by Jonathan Miguel Onrubia Solis on 2/4/24.
//

import Foundation


struct ProductModel {
    var id: Int
    var imageName: String
    var title: String
    var subTitle: String
    var price: String
    var isFavorite: Bool
    var description: String
    var rating: Int
    
    static func getProducts() -> [ProductModel] {
        return [ProductModel(id: 0, imageName: "image1", title: "Modern light clothes", subTitle: "Dress Modern", price: "$212", isFavorite: true, description: "Its Simple and elegant shape makes it perfect for those of you who want minimalist clothes.", rating: 4),
                ProductModel(id: 1, imageName: "image2", title: "Modern light clothes", subTitle: "Dress Modern", price: "$190", isFavorite: false, description: "Its Simple and elegant shape makes it perfect for those of you who want minimalist clothes.", rating: 3),
                ProductModel(id: 2, imageName: "image3", title: "Modern light clothes", subTitle: "Dress Modern", price: "$110", isFavorite: false, description: "Its Simple and elegant shape makes it perfect for those of you who want minimalist clothes.", rating: 5),
                ProductModel(id: 3, imageName: "image4", title: "Modern light clothes", subTitle: "Dress Modern", price: "$130", isFavorite: true, description: "Its Simple and elegant shape makes it perfect for those of you who want minimalist clothes.", rating: 4),
                ProductModel(id: 4, imageName: "image5", title: "Modern light clothes", subTitle: "Dress Modern", price: "$125", isFavorite: true, description: "Its Simple and elegant shape makes it perfect for those of you who want minimalist clothes.", rating: 2)]
    }
}

