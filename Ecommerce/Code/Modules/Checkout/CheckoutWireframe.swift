

import SwiftUI

final class CheckoutWireframe {

    private var navigationManager: any NavigationManagerProtocol
    private var shoppingCartManager: ShoppingCartManager
    
    init(navigationManager: any NavigationManagerProtocol, shoppingCartManager: ShoppingCartManager) {
        self.navigationManager = navigationManager
        self.shoppingCartManager = shoppingCartManager
    }
    
    var view: CheckoutView {
        CheckoutView(viewModel: self.viewModel)
    }
    
    private var viewModel: CheckoutViewModel {
        CheckoutViewModel(navigationManager: navigationManager, shoppingCartManager: shoppingCartManager)
    }

    // MARK: - Public Functions
    
    func preview() -> some View {
        view
    }
}


