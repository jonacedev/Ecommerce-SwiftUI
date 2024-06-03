

import SwiftUI

final class MainTabBarWireframe {
    
    private var navigationManager: any NavigationManagerProtocol
    private var shoppingCartManager: ShoppingCartManager
    
    init(navigationManager: any NavigationManagerProtocol, shoppingCartManager: ShoppingCartManager) {
        self.navigationManager = navigationManager
        self.shoppingCartManager = shoppingCartManager
    }

    // MARK: - Private Functions
    
    var view: MainTabBarView {
        MainTabBarView(viewModel: self.viewModel)
    }
    
    private var viewModel: MainTabBarViewModel {
        MainTabBarViewModel(navigationManager: navigationManager, shoppingCartManager: shoppingCartManager)
    }

    // MARK: - Public Functions
    
    func preview() -> some View {
        view
    }

}


