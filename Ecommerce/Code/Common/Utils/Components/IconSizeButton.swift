//
//  IconButtonStroke.swift
//  Ecommerce
//
//  Created by Jonathan Miguel Onrubia Solis on 4/4/24.
//

import SwiftUI

enum ClotheSize: String, CaseIterable {
    case xs = "XS"
    case s = "S"
    case m = "M"
    case l = "L"
    case xl = "XL"
}

struct IconSizeButton: View {
    
    var size: ClotheSize
    @Binding var sizeSelected: ClotheSize
    var backgroundColor: Color = .primaryApp
    var iconColor: Color = .white
    
    var body: some View {
        Button(action: {
            sizeSelected = size
        }, label: {
            Text(size.rawValue)
                .frame(width: 20, height: 20)
                .padding(10)
                .font(.system(size: 12).bold())
                .foregroundStyle(sizeSelected == size ? .white : Color.primaryApp)
                .background(sizeSelected == size ? backgroundColor : .clear)
            
        })
        .background(
            Circle()
                .stroke(Color.primaryApp, lineWidth: 1)
        )
        .clipShape(Circle())
        
    }
}


#Preview {
    IconSizeButton(size: .s, sizeSelected: .constant(.s))
}
