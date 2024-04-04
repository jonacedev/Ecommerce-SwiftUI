//
//  UIApplication+Window.swift
//  PokeApp
//
//  Created by Jonathan Onrubia Solis on 20/3/24.
//


import UIKit

extension UIApplication {

    var keyWindow: UIWindow? {
        // Get connected scenes
        return self.connectedScenes
            // Keep only active scenes, onscreen and visible to the user
            .filter { $0.activationState == .foregroundActive }
            // Keep only the first `UIWindowScene`
            .first(where: { $0 is UIWindowScene })
            // Get its associated windows
            .flatMap({ $0 as? UIWindowScene })?.windows
            // Finally, keep only the key window
            .first(where: \.isKeyWindow)
    }

    static let screenWidth = UIApplication.shared.connectedScenes
        .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
        .first { $0.isKeyWindow}?.screen.bounds.width ?? 0.0

    static let screenHeight =  UIApplication.shared.connectedScenes
        .flatMap {($0 as? UIWindowScene)?.windows ?? []}
        .first { $0.isKeyWindow }?.screen.bounds.height ?? 0.0

    static let screenBounds =  UIApplication.shared.connectedScenes
        .flatMap {($0 as? UIWindowScene)?.windows ?? []}
        .first { $0.isKeyWindow }?.screen.bounds ?? .zero

    static let safeArea =  UIApplication.shared.connectedScenes
        .flatMap {($0 as? UIWindowScene)?.windows ?? []}
        .first { $0.isKeyWindow }?.safeAreaInsets ?? .zero
}
