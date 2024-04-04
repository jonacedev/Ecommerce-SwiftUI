//
//  CustomSearchBar.swift
//  Ecommerce
//
//  Created by Jonathan Miguel Onrubia Solis on 2/4/24.
//

import SwiftUI

enum BarSize: CGFloat {
    case small = 30
    case medium = 50
    case big = 70
}

struct CustomSearchBar: View {
    
    @Binding var text: String
    var placeholder: String
    var size: BarSize = .medium
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.secondary)
            
            TextField(placeholder, text: $text)
                .frame(height: size.rawValue)
               
            if text != "" {
                Image(systemName: "xmark.circle.fill")
                    .imageScale(.medium)
                    .foregroundColor(Color(.systemGray3))
                    .onTapGesture {
                        withAnimation {
                            self.text = ""
                          }
                    }
            }
        }
        .padding(.horizontal, 20)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(.gray, lineWidth: 0.5)
        )
    }
}

#Preview {
    CustomSearchBar(text: .constant(""), placeholder: "search")
}
