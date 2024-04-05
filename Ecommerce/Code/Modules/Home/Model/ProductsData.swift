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
    
    // MARK: - Only to use in previews
    @Published var productCartMock: ProductCartModel = ProductCartModel(productId: 0, finalPrice: 209.99, amount: 1, sizeSelected: .s)
    
    @Published var products: [ProductModel] = [ProductModel(id: 0,
                                                            imageName: "image1",
                                                            title: "Modern light clothes",
                                                            subTitle: "Dress Modern",
                                                            price: 29.99,
                                                            isFavorite: true,
                                                            description: "Its Simple and elegant shape makes it perfect for those of you who want minimalist clothes.",
                                                            rating: 4,
                                                            reviews: 13),
                                               ProductModel(id: 1,
                                                            imageName: "image2",
                                                            title: "Modern light clothes",
                                                            subTitle: "Dress Modern",
                                                            price: 19.99,
                                                            isFavorite: false,
                                                            description: "Its Simple and elegant shape makes it perfect for those of you who want minimalist clothes.",
                                                            rating: 3,
                                                            reviews: 20),
                                               ProductModel(id: 2,
                                                            imageName: "image3",
                                                            title: "Modern light clothes",
                                                            subTitle: "Dress Modern",
                                                            price: 24.99,
                                                            isFavorite: false,
                                                            description: "Its Simple and elegant shape makes it perfect for those of you who want minimalist clothes.",
                                                            rating: 5,
                                                            reviews: 15),
                                               ProductModel(id: 3,
                                                            imageName: "image4",
                                                            title: "Modern light clothes",
                                                            subTitle: "Dress Modern",
                                                            price: 29.99,
                                                            isFavorite: true,
                                                            description: "Its Simple and elegant shape makes it perfect for those of you who want minimalist clothes.",
                                                            rating: 4,
                                                            reviews: 34),
                                               ProductModel(id: 4,
                                                            imageName: "image5",
                                                            title: "Modern light clothes",
                                                            subTitle: "Dress Modern",
                                                            price: 22.99,
                                                            isFavorite: true,
                                                            description: "Its Simple and elegant shape makes it perfect for those of you who want minimalist clothes.",
                                                            rating: 2,
                                                            reviews: 76)]
    
    
    func addProductToCart(product: ProductCartModel) {
        if let idx = productsCart.firstIndex(where: { $0.id == product.id && $0.sizeSelected == product.sizeSelected }) {
            productsCart[idx].finalPrice += product.finalPrice
            productsCart[idx].amount += product.amount
        }
        else {
            productsCart.append(product)
        }
    }
    
    func updateProductCart(id: Int, newPrice: Double, newItemsAmount: Int) {
        if let idx = productsCart.firstIndex(where: { $0.id == id }) {
            productsCart[idx].finalPrice = newPrice
            productsCart[idx].amount = newItemsAmount
        }
    }
}
