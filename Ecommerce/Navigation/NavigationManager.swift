//
//  NavigationManager.swift
//  Ecommerce
//
//  Created by Jonathan Miguel Onrubia Solis on 23/5/24.
//

import SwiftUI

enum NavigationDestination: Identifiable, Hashable {
    var id: Self { self }
    case home
    case productDetail(product: ProductModel)
}

enum RootView {
    case splash
    case home
}

class NavigationManager: NavigationManagerProtocol {
    
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
    
    func dismiss() {
        present = nil
        presentedModal = nil
    }
    
    func dismiss(withCompletion: @escaping () -> Void) {
        dismiss()
        withCompletion()
    }
    
    func popToRoot() {
        guard !path.isEmpty else {
            print("path is empty, cannot go to root")
            return
        }
        path.removeLast(path.count)
    }
    
    func popToLast() {
        guard !path.isEmpty else {
            print("path is empty, cannot go back")
            return
        }
        path.removeLast()
    }
    
    func reset() {
        path = NavigationPath()
        present = nil
        presentedModal = nil
    }
}
