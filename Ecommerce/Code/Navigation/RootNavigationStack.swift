//
//  RootNavigationView.swift
//  Ecommerce
//
//  Created by Jonathan Miguel Onrubia Solis on 23/5/24.
//

import SwiftUI

struct RootNavigationStack<Content: View>: View {
    @ObservedObject var navigationManager: NavigationManager
    let shoppingCartManager: ShoppingCartManager
    let content: Content
    
    init(navigationManager: NavigationManager, shoppingCartManager: ShoppingCartManager, @ViewBuilder content: () -> Content) {
        self.navigationManager = navigationManager
        self.shoppingCartManager = shoppingCartManager
        self.content = content()
    }
    
    var body: some View {
        NavigationStack(path: $navigationManager.path) {
            content
                .navigationDestination(for: NavigationDestination.self) { destination in
                    DestinationView(navigationManager: navigationManager, shoppingCartManager: shoppingCartManager, destination: destination)
                }
                .fullScreenCover(item: $navigationManager.present) { destination in
                    DestinationView(navigationManager: navigationManager, shoppingCartManager: shoppingCartManager, destination: destination)
                }
                .sheet(item: $navigationManager.presentedModal) { destination in
                    DestinationView(navigationManager: navigationManager, shoppingCartManager: shoppingCartManager, destination: destination)
                }
        }
    }
}

