


import SwiftUI

struct LaunchView: View {
    @StateObject var viewModel: LaunchViewModel

    var body: some View {
        BaseView(content: content, vm: viewModel)
    }

    @ViewBuilder private func content() -> some View {
        ZStack {
            //Image("ic_launch_logo")
            Text("Splash")
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                viewModel.goHome()
            })
           
        }
    }
}

#Preview {
    LaunchWireframe(navigator: nil).preview()
}
