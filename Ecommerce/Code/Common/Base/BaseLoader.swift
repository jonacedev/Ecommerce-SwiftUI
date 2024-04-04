//
//  BaseLoader.swift
//  PokeApp
//
//  Created by Jonathan Onrubia Solis on 20/3/24.
//


import SwiftUI

struct BaseLoader: View {
    @State var backOpacity: CGFloat = 0.3

    var body: some View {
        ZStack {
            BaseBlur().opacity(backOpacity).ignoresSafeArea()
            VStack {
                progressBar()
                Text("Cargando").foregroundStyle(.green).font(.largeTitle).padding(.top)
            }

        }
        .onAppear {
            withAnimation {
                backOpacity = 0.95
            }
        }
    }

    @ViewBuilder private func progressBar() -> some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: Color.green))
            .scaleEffect(2)
    }
}

#Preview {
    BaseLoader()
}

