//
//  NavigationManager.swift
//  Ecommerce
//
//  Created by Jonathan Miguel Onrubia Solis on 23/5/24.
//

import SwiftUI

enum NavigationDestination: Identifiable, Hashable {
    var id: NavigationDestination { self }
    case productDetail(product: Product)
}

class NavigationManager: NavigationManagerProtocol {
    
    @Published var path = NavigationPath()
    
    func push(_ destination: NavigationDestination) {
        path.append(destination)
    }
    
    func popToRoot() {
        guard !path.isEmpty else { return }
        path.removeLast(path.count)
    }
    
    func popToLast() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }
}
