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
            ZStack {
                rootView()
                    .environmentObject(navigationManager)
                    .onReceive(navigationManager.$currentRoot) { _ in
                        navigationManager.reset()
                    }
                alert()
                loader()
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
    
    @ViewBuilder func alert() -> some View {
        if let alert = navigationManager.alert {
            BaseAlert(model: alert)
        }
    }

    @ViewBuilder func loader() -> some View {
        if navigationManager.loading == true {
            BaseLoader()
        }
    }
}
