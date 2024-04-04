//
//  ProductsData.swift
//  Ecommerce
//
//  Created by Jonathan Miguel Onrubia Solis on 4/4/24.
//

import Foundation

class ProductsData: ObservableObject {
    
    static let shared = ProductsData()
    
    private init() {}
    
    @Published var productsCart: [ProductCartModel] = []
    
    @Published var products: [ProductModel] = [ProductModel(id: 0,
                                                            imageName: "image1",
                                                            title: "Modern light clothes",
                                                            subTitle: "Dress Modern",
                                                            price: 209.99,
                                                            isFavorite: true,
                                                            description: "Its Simple and elegant shape makes it perfect for those of you who want minimalist clothes.",
                                                            rating: 4,
                                                            reviews: 213),
                                               ProductModel(id: 1,
                                                            imageName: "image2",
                                                            title: "Modern light clothes",
                                                            subTitle: "Dress Modern",
                                                            price: 190.99,
                                                            isFavorite: false,
                                                            description: "Its Simple and elegant shape makes it perfect for those of you who want minimalist clothes.",
                                                            rating: 3,
                                                            reviews: 2120),
                                               ProductModel(id: 2,
                                                            imageName: "image3",
                                                            title: "Modern light clothes",
                                                            subTitle: "Dress Modern",
                                                            price: 109.99,
                                                            isFavorite: false,
                                                            description: "Its Simple and elegant shape makes it perfect for those of you who want minimalist clothes.",
                                                            rating: 5,
                                                            reviews: 115),
                                               ProductModel(id: 3,
                                                            imageName: "image4",
                                                            title: "Modern light clothes",
                                                            subTitle: "Dress Modern",
                                                            price: 129.99,
                                                            isFavorite: true,
                                                            description: "Its Simple and elegant shape makes it perfect for those of you who want minimalist clothes.",
                                                            rating: 4,
                                                            reviews: 34),
                                               ProductModel(id: 4,
                                                            imageName: "image5",
                                                            title: "Modern light clothes",
                                                            subTitle: "Dress Modern",
                                                            price: 124.99,
                                                            isFavorite: true,
                                                            description: "Its Simple and elegant shape makes it perfect for those of you who want minimalist clothes.",
                                                            rating: 2,
                                                            reviews: 93)]
}
