
import SwiftUI

struct MainTabBarView: View {
    
    @StateObject var viewModel: MainTabBarViewModel
    
    var body: some View {
        BaseView(content: content, vm: viewModel)
    }

    @ViewBuilder private func content() -> some View {

        ZStack(alignment: .bottom) {
            TabView(selection: $viewModel.tabSelection) {
                viewModel.vwHome
                    .tag(MainTabBarViewModel.TabSelection.home.rawValue)
                    .transition(.move(edge: .leading))
                    .environmentObject(viewModel)
                viewModel.vwFavorites
                    .tag(MainTabBarViewModel.TabSelection.favorites.rawValue)
                    .transition(.move(edge: .trailing))
                    .environmentObject(viewModel)
                viewModel.vwCheckout
                    .tag(MainTabBarViewModel.TabSelection.checkout.rawValue)
                    .transition(.move(edge: .trailing))
                    .environmentObject(viewModel)
            }
    
            tabBar()
        }
        .onAppear{
           hideDefaultTabBar()
        }
        .animation(.default, value: viewModel.tabSelection)
        .ignoresSafeArea(edges: .bottom)
            
    }
    
    func hideDefaultTabBar() {
        UITabBar.appearance().isHidden = true
    }

    @ViewBuilder private func tabBar() -> some View {
        BaseTabBar(tabSelected: $viewModel.tabSelection, items: [
            BaseTabBar.TabItem(text: "Home", image: "home"),
            BaseTabBar.TabItem(text: "Favorites", image: "heart"),
            BaseTabBar.TabItem(text: "Checkout", image: "bag_empty")
        ])
        .onAppear {
            viewModel.readyTab()
        }
    }
}

#Preview {
    MainTabBarWireframe(navigator: nil).preview()
}
