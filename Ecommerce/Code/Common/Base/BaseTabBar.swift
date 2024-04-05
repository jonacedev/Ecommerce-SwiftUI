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
    private let height: CGFloat = max(UIApplication.safeArea.bottom, 16) + 35

    var body: some View {
       
        HStack(spacing: 0) {
            ForEach(Array(items.enumerated()), id: \.offset) {idx, item in
                VStack(spacing: 2) {
                    Image(item.image)
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(tabSelected == idx ? .white : .gray)
                    Text(item.text)
                        .font(tabSelected == idx ? .system(size: 11).bold() : .system(size: 11))
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: height)
                .background(Color.primaryApp)
                .foregroundStyle(Color.white)
                .onTapGesture {
                    tabSelected = idx
                }
            }
        }
        .frame(width: UIApplication.screenWidth - 40, height: height)
        .clipShape(Capsule())
        .padding(.bottom, 20)
    }
}

#Preview {
    BaseTabBar(tabSelected: Binding.constant(0), items: [BaseTabBar.TabItem(text: "Texto 1", image: "home"),
                                                         BaseTabBar.TabItem(text: "Texto 2", image: "heart"),
                                                         BaseTabBar.TabItem(text: "Texto 3", image: "bag_empty")])
}
