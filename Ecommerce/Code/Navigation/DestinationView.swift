//
//  DestinationView.swift
//  Ecommerce
//
//  Created by Jonathan Miguel Onrubia Solis on 23/5/24.
//

import SwiftUI

struct DestinationView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    let destination: NavigationDestination

    var body: some View {
        switch destination {
        case .home:
            HomeWireframe(navigationManager: navigationManager).view
        case .productDetail(let product):
            ProductDetailWireframe(navigationManager: navigationManager, product: product).view
        }
    }
}
