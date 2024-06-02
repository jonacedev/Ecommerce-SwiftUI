//
//  RootNavigationView.swift
//  Ecommerce
//
//  Created by Jonathan Miguel Onrubia Solis on 23/5/24.
//

import SwiftUI

struct RootNavigationView<Content: View>: View {
    
    @EnvironmentObject var navigationManager: NavigationManager
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        NavigationStack(path: $navigationManager.path) {
            content
                .navigationDestination(for: NavigationDestination.self) { destination in
                    DestinationView(destination: destination)
                }
                .fullScreenCover(item: $navigationManager.present) { destination in
                    DestinationView(destination: destination)
                }
                .sheet(item: $navigationManager.presentedModal) { destination in
                    DestinationView(destination: destination)
                }
        }
        .environmentObject(navigationManager)
    }
}

