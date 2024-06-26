//
//  RootNavigationView.swift
//  Ecommerce
//
//  Created by Jonathan Miguel Onrubia Solis on 23/5/24.
//

import SwiftUI

struct NStack<Content: View>: View {
    
    @Binding var path: NavigationPath
    var navigationManager: NavigationManager
    var rootManager: RootManager
    var shoppingCartManager: ShoppingCartManager
    var content: Content
    
    init(path: Binding<NavigationPath>, navigationManager: NavigationManager, rootManager: RootManager, shoppingCartManager: ShoppingCartManager, @ViewBuilder content: () -> Content) {
        self._path = path
        self.navigationManager = navigationManager
        self.rootManager = rootManager
        self.shoppingCartManager = shoppingCartManager
        self.content = content()
    }
    
    var body: some View {
        NavigationStack(path: $path) {
            content
                .navigationDestination(for: NavigationDestination.self) { destination in
                    switch destination {
                    case .productDetail(let product):
                        ProductDetailWireframe(navigationManager: navigationManager, rootManager: rootManager, shoppingCartManager: shoppingCartManager, product: product).view
                    }
                }
        }
    }
}
