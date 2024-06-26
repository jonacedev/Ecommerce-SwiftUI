
import SwiftUI

struct MainTabBarView: View {
    
    @StateObject var viewModel: MainTabBarViewModel
    @StateObject var shoppingCartManager = ShoppingCartManager()
    
    @StateObject var homeNavigationManager = NavigationManager()
    @StateObject var favoritesNavigationManager = NavigationManager()
    @StateObject var checkoutNavigationManager = NavigationManager()
    
    var body: some View {
        BaseView(content: content)
    }
    
    @ViewBuilder private func content() -> some View {
        
        ZStack(alignment: .bottom) {
            TabView(selection: $viewModel.tabSelection) {
                Group {
                    NStack(path: $homeNavigationManager.path,
                           navigationManager:homeNavigationManager,
                           rootManager: viewModel.rootManager,
                           shoppingCartManager: shoppingCartManager) {
                        HomeWireframe(navigationManager: homeNavigationManager, rootManager: viewModel.rootManager).view
                    }
                           .tag(TabSelection.home.rawValue)
                           .transition(.move(edge: .leading))
                    
                    NStack(path: $favoritesNavigationManager.path,
                           navigationManager: favoritesNavigationManager,
                           rootManager: viewModel.rootManager,
                           shoppingCartManager: shoppingCartManager) {
                        FavoritesWireframe(navigationManager: favoritesNavigationManager, rootManager: viewModel.rootManager).view
                    }
                           .tag(TabSelection.favorites.rawValue)
                           .transition(.move(edge: .trailing))
                    
                    NStack(path: $checkoutNavigationManager.path,
                           navigationManager: checkoutNavigationManager,
                           rootManager: viewModel.rootManager,
                           shoppingCartManager: shoppingCartManager) {
                        CheckoutWireframe(navigationManager: checkoutNavigationManager, rootManager: viewModel.rootManager, shoppingCartManager: shoppingCartManager).view
                    }
                           .tag(TabSelection.checkout.rawValue)
                           .transition(.move(edge: .trailing))
                }
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
            BaseTabBar.TabItem(text: "tabbar_home_title".localized, image: "home"),
            BaseTabBar.TabItem(text: "tabbar_favorites_title".localized, image: "heart"),
            BaseTabBar.TabItem(text: "tabbar_checkout_title".localized, image: "bag_empty")
        ])
        .onAppear {
            viewModel.readyTab()
        }
    }
}

#Preview {
    MainTabBarWireframe(rootManager: RootManager()).view
}
