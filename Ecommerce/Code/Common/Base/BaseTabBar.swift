//
//  BaseTabBar.swift
//  Ecommerce
//
//  Created by Jonathan Miguel Onrubia Solis on 4/4/24.
//


import SwiftUI

struct BaseTabBar: View {

    struct TabItem {
        let text, image: String
    }

    @Binding var tabSelected: Int
    let items: [TabItem]
    private let height: CGFloat = max(UIApplication.safeArea.bottom, 16) + 30

    var body: some View {
       
        HStack(spacing: 0) {
            ForEach(Array(items.enumerated()), id: \.offset) {idx, item in
                VStack(spacing: 2) {
                    Image(item.image)
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 18, height: 18)
                    Text(item.text)
                        .font(tabSelected == idx ? .system(size: 10).bold() : .system(size: 10))
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: height)
                .background(tabSelected == idx ? Color.white : Color.primaryApp)
                .foregroundStyle(tabSelected == idx ? Color.black : .white)
                .onTapGesture {
                    tabSelected = idx
                }
            }
        }
        .frame(width: UIApplication.screenWidth - 40, height: height)
        .clipShape(RoundedCorner())
        .padding(.bottom, 20)
    
    }
}

#Preview {
    BaseTabBar(tabSelected: Binding.constant(0), items: [BaseTabBar.TabItem(text: "Texto 1", image: "ic_back"),
                                                         BaseTabBar.TabItem(text: "Texto 2", image: "ic_back"),
                                                         BaseTabBar.TabItem(text: "Texto 3", image: "ic_back")])
}
