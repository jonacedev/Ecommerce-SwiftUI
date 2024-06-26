//
//  DestinationView.swift
//  Ecommerce
//
//  Created by Jonathan Miguel Onrubia Solis on 23/5/24.
//

import SwiftUI

struct DestinationView: View {
    var navigationManager: NavigationManager
    var rootManager: RootManager
    var shoppingCartManager: ShoppingCartManager
    let destination: NavigationDestination

    var body: some View {
        switch destination {
        case .productDetail(let product):
            ProductDetailWireframe(navigationManager: navigationManager, rootManager: rootManager, shoppingCartManager: shoppingCartManager, product: product).view
        }
    }
}
