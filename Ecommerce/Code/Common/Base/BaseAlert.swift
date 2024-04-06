//
//  BaseAlert.swift
//
//  Created by Jonathan Onrubia Solis on 20/3/24.
//

import SwiftUI

struct BaseAlert: View {

    struct Model: Equatable {
        static func == (lhs: BaseAlert.Model, rhs: BaseAlert.Model) -> Bool {
            return lhs.title == rhs.title && lhs.description == rhs.description
        }

        var image: String?
        var title = "", description = "", buttonText1 = "", buttonText2 = ""
        var closeAfterAction1 = true
        var closeAfterAction2 = true
        var feedback: UINotificationFeedbackGenerator.FeedbackType?
        let action1: () -> Void
        var action2: (() -> Void)?
    }

    @State var fixedSize = false
    @State var maxHeight: CGFloat = 0
    @State var backOpacity: CGFloat = 0
    let model: Model

    var body: some View {
        ZStack {
            BaseBlur().opacity(backOpacity).ignoresSafeArea()
            alert()
        }
        .ignoresSafeArea()
        .onAppear {
            withAnimation {
                backOpacity = 0.95
                maxHeight = 500
                fixedSize = true
            }
            if let feedback = model.feedback {
                let generator = UINotificationFeedbackGenerator()
                generator.notificationOccurred(feedback)
            }
        }
    }

    @ViewBuilder func alert() -> some View {
        VStack {
            Spacer()
            ZStack {
                Color.white
                    .ignoresSafeArea()
                    .clipShape(RoundedCorner(radius: 20, corners: [.topLeft, .topRight]))
                VStack(spacing: 12) {

                    if let image = model.image {
                        Image(image).resizable().frame(width: 36, height: 36, alignment: .center).foregroundStyle(.white)
                    }

                    alertTexts()

                    buttons()

                }
                .padding()
            }
            .frame(maxHeight: maxHeight)
            .clipped()
            .fixedSize(horizontal: false, vertical: fixedSize)
        }
    }

    @ViewBuilder func alertTexts() -> some View {
        Text(model.title).font(.subheadline).foregroundStyle(Color.primaryApp).multilineTextAlignment(.center)
        Text(model.description).font(.body).foregroundStyle(Color.primaryApp)
            .multilineTextAlignment(.center)
    }

    @ViewBuilder func buttons() -> some View {
        VStack(spacing: 16) {
            BaseButton(style: .primary, text: model.buttonText1, height: 45) {

                impactFeedback(style: .light)

                if model.closeAfterAction1 {
                    withAnimation {
                        maxHeight = 0
                        backOpacity = 0
                    }
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
                    model.action1()
                }
            }
            if let action2 = model.action2 {
                BaseButton(style: .secondary, text: model.buttonText2, height: 45) {

                    impactFeedback(style: .light)

                    if model.closeAfterAction2 {
                        withAnimation {
                            maxHeight = 0
                            backOpacity = 0
                        }
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
                        action2()
                    }
                }
            }
        }.padding(24)
            .padding(.horizontal)
    }
}

#Preview {
    BaseAlert(model: BaseAlert.Model(image: "ic_launch_logo", title: "Título", description: "Descripción", buttonText1: "Botón 1", buttonText2: "Botón 2",
                                     action1: {},
                                     action2: {}))
}
