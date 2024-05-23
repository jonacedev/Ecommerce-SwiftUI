


import SwiftUI

struct LaunchView: View {
    
    @StateObject var viewModel: LaunchViewModel

    var body: some View {
        BaseView(content: content, vm: viewModel)
    }

    @ViewBuilder private func content() -> some View {
        ZStack(alignment: .center) {
            Image("splash")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                Text("app_title".localized)
                    .foregroundStyle(.white)
                    .font(.custom("Verdana", size: 30).bold())
                    .padding(.bottom, 25)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                viewModel.goHome()
            })
           
        }
    }
}

#Preview {
    LaunchWireframe(navigationManager: nil).preview()
}
