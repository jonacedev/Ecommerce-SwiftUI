//
//  IconButton.swift
//  Ecommerce
//
//  Created by Jonathan Miguel Onrubia Solis on 2/4/24.
//

import SwiftUI

enum ButtonSize: CGFloat {
    case small = 15
    case medium = 20
    case big = 28
}

struct IconButton: View {
    var image: String
    var size: ButtonSize = .medium
    var backgroundColor: Color = .primaryApp
    var iconColor: Color = .white
    var cornerRadius: CGFloat = 14
    var isCircular: Bool = false
    var action: () -> Void
    
    var body: some View {
        if isCircular {
            Button(action: {
                action()
            }, label: {
                Image(image)
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: size.rawValue, height: size.rawValue)
                    .padding(8)
                    .foregroundStyle(iconColor)
            })
            .background(backgroundColor)
            .clipShape(Circle())
        } else {
            Button(action: {
                action()
            }, label: {
                Image(image)
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: size.rawValue, height: size.rawValue)
                    .padding(10)
                    .foregroundStyle(iconColor)
            })
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
        }
    }
}

#Preview {
    IconButton(image: "filter", action: { })
}
