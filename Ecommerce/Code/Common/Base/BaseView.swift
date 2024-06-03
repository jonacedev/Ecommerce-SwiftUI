//
//  BaseView.swift
//
//  Created by Jonathan Onrubia Solis on 20/3/24.
//

import Foundation
import SwiftUI

struct BaseView<Content: View>: View {

    let content: () -> Content

    var body: some View {
        ZStack {
            content()
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
}
