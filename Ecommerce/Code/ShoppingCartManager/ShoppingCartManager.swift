//
//  ShoppingCartManager.swift
//  Ecommerce
//
//  Created by Jonathan Miguel Onrubia Solis on 3/6/24.
//

import SwiftUI
import Combine

class ShoppingCartManager: ObservableObject {
    @Published var productsCart: [ProductCartModel] = []
    
    func addProduct(product: ProductCartModel) {
        if let index = productsCart.firstIndex(where: { $0.detail?.id == product.detail?.id && $0.sizeSelected == product.sizeSelected }) {
            productsCart[index].finalPrice += product.finalPrice
            productsCart[index].amount += product.amount
            productsCart = productsCart
        } else {
            productsCart.append(product)
        }
    }
    
    func updateProductCart(id: String?, newPrice: Double, newItemsAmount: Int) {
        if let idx = productsCart.firstIndex(where: { $0.detail?.id == id }) {
            productsCart[idx].finalPrice = newPrice
            productsCart[idx].amount = newItemsAmount
            productsCart = productsCart
        }
    }
        
    func removeProduct(_ indexSet: IndexSet) {
        productsCart.remove(atOffsets: indexSet)
        productsCart = productsCart
    }
    
    func removeCart() {
        productsCart.removeAll()
    }
}
