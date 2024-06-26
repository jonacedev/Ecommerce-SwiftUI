//
//  NavigationManagerProtocol.swift
//  Ecommerce
//
//  Created by Jonathan Miguel Onrubia Solis on 23/5/24.
//

import SwiftUI

protocol NavigationManagerProtocol: ObservableObject {
    var path: NavigationPath { get set }
    func push(_ destination: NavigationDestination)
    func popToRoot()
    func popToLast()
}
