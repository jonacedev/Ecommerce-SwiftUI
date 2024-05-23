//
//  EcommerceApp.swift
//  Ecommerce
//
//  Created by Jonathan Miguel Onrubia Solis on 23/5/24.
//


import SwiftUI

@main
struct EcommerceApp: App {
    @StateObject private var navigationManager = NavigationManager()
    
    var body: some Scene {
        WindowGroup {
            Group {
                ZStack {
                    rootView()
                }
            }
            .environmentObject(navigationManager)
            .onReceive(navigationManager.$currentRoot) { _ in
                navigationManager.reset()
            }
        }
    }
    
    @ViewBuilder
    private func rootView() -> some View {
        switch navigationManager.currentRoot {
        case .splash:
            LaunchWireframe(navigationManager: navigationManager).view
        case .home:
            RootNavigationView {
                MainTabBarWireframe(navigationManager: navigationManager).view
            }
        }
    }
}
