//
//  EcommerceApp.swift
//  Ecommerce
//
//  Created by Jonathan Miguel Onrubia Solis on 23/5/24.
//


import SwiftUI

@main
struct EcommerceApp: App {
    
    @StateObject private var rootManager = RootManager()
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                RootView()
                alert()
                loader()
            }
        }
    }
    
    @ViewBuilder
    private func RootView() -> some View {
        switch rootManager.currentRoot {
        case .splash:
            LaunchWireframe(rootManager: rootManager).view
        case .home:
            MainTabBarWireframe(rootManager: rootManager).view
        }
    }
    
    @ViewBuilder func alert() -> some View {
        if let alert = rootManager.alert {
            BaseAlert(model: alert)
        }
    }

    @ViewBuilder func loader() -> some View {
        if rootManager.loading == true {
            BaseLoader()
        }
    }
}
