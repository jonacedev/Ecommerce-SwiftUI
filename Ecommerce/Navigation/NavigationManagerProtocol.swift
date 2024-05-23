//
//  NavigationManagerProtocol.swift
//  Ecommerce
//
//  Created by Jonathan Miguel Onrubia Solis on 23/5/24.
//

import SwiftUI

protocol NavigationManagerProtocol: ObservableObject {
    var currentRoot: RootView { get set }
    var path: NavigationPath { get set }
    var present: NavigationDestination? { get set }
    var presentedModal: NavigationDestination? { get set }
    
    func push(_ destination: NavigationDestination)
    func presentModal(_ destination: NavigationDestination, fullScreen: Bool)
    func dismiss()
    func dismiss(withCompletion: @escaping () -> Void)
    func popToRoot()
    func popToLast()
    func reset()
}
