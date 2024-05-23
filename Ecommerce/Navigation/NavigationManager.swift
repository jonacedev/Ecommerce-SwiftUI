//
//  NavigationManager.swift
//  Ecommerce
//
//  Created by Jonathan Miguel Onrubia Solis on 23/5/24.
//

import SwiftUI

// Enum para definir diferentes destinos de navegación
enum NavigationDestination: Identifiable, Hashable {
    case home
    case productDetail(product: ProductModel)
    var id: Self { self }
}

enum RootView {
    case splash
    case home
}

// Clase de modelo de navegación
class NavigationManager: ObservableObject {
    
    @Published var currentRoot: RootView = .splash
    @Published var path = NavigationPath()
    @Published var present: NavigationDestination?
    @Published var presentedModal: NavigationDestination?
    

    func push(_ destination: NavigationDestination) {
        path.append(destination)
    }

    func presentModal(_ destination: NavigationDestination, fullScreen: Bool = false) {
        if fullScreen {
            present = destination
        } else {
            presentedModal = destination
        }
    }
    
    // MARK: - Dismiss functions
    
    func dismiss() {
        present = nil
        presentedModal = nil
    }
    
    func dismiss(withCompletion: @escaping () -> Void) {
        present = nil
        presentedModal = nil
        withCompletion()
    }
    
    // MARK: - Pop to..

    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func popToLast() {
        path.removeLast()
    }
    
    // MARK: - Reset
    
    func reset() {
        path.removeLast(path.count)
        present = nil
        presentedModal = nil
    }
}

