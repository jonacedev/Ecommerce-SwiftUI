

import SwiftUI

final class CheckoutWireframe {

    private var navigationManager: NavigationManager?
    
    init(navigationManager: NavigationManager?) {
        self.navigationManager = navigationManager
    }
    
    var view: CheckoutView {
        CheckoutView(viewModel: self.viewModel)
    }
    
    private var viewModel: CheckoutViewModel {
        CheckoutViewModel(navigationManager: navigationManager)
    }

    // MARK: - Public Functions
    
    func preview() -> some View {
        view
    }
}


