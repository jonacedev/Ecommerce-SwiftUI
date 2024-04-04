//
//  BaseButton.swift
//  PokeApp
//
//  Created by Jonathan Onrubia Solis on 21/3/24.
//

import SwiftUI

struct BaseButton: View {

    enum Style {
        case primary
        case secondary
        case disabled
    }

    let style: Style
    let text: String
    var image: String?
    var height: CGFloat = 60 // Default height
    let action: () -> Void

    var body: some View {
        Button(action: action, label: {
            HStack(spacing: 6) {
                if let image = image {
                    Image(image)
                }
                Text(text).font(.headline)
            }
            .frame(height: height)
            .frame(maxWidth: .infinity)
            .foregroundStyle(textColor())
            .background(backColor())
            .overlay {
                overlay()
            }
            .cornerRadius(8)
        })
    }

    private func overlay() -> some View {
        switch style {
        default :
            return RoundedRectangle(cornerRadius: 8).stroke(Color.clear, lineWidth: 0)
//            return RoundedRectangle(cornerRadius: 8, style: .continuous).stroke(Color.clear, lineWidth: 0)
        }
    }

    private func backColor() -> Color {
        switch style {
        case .primary: return Color.primaryApp
        case .secondary: return .white
        default: return Color.primaryApp
        }
    }

    private func textColor() -> Color {
        switch style {
        case .primary: return .white
        case .secondary: return Color.primaryApp
        default: return Color.primaryApp
        }
    }

}

