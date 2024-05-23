

import SwiftUI

final class FavoritesWireframe {

    private var navigationManager: NavigationManager?
    
    init(navigationManager: NavigationManager?) {
        self.navigationManager = navigationManager
    }

    // MARK: - Private Functions
    
    var view: FavoritesView {
        FavoritesView(viewModel: self.viewModel)
    }
    
    private var viewModel: FavoritesViewModel {
        FavoritesViewModel(navigationManager: navigationManager)
    }

    // MARK: - Public Functions
    
    func preview() -> some View {
        view
    }
}


