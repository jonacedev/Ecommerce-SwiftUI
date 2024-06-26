

import SwiftUI

final class CheckoutWireframe {

    private var navigationManager: NavigationManager
    private var rootManager: RootManager
    private var shoppingCartManager: ShoppingCartManager

    init(navigationManager: NavigationManager, rootManager: RootManager, shoppingCartManager: ShoppingCartManager) {
        self.navigationManager = navigationManager
        self.rootManager = rootManager
        self.shoppingCartManager = shoppingCartManager
    }

    var view: CheckoutView {
        CheckoutView(viewModel: self.viewModel)
    }

    private var viewModel: CheckoutViewModel {
        CheckoutViewModel(navigationManager: navigationManager, rootManager: rootManager, shoppingCartManager: shoppingCartManager)
    }

    // MARK: - Public Functions

    func preview() -> some View {
        view
    }
}


