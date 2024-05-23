

import SwiftUI

final class HomeWireframe {

    private var navigationManager: any NavigationManagerProtocol
    
    init(navigationManager: any NavigationManagerProtocol) {
        self.navigationManager = navigationManager
    }
    
    var view: HomeView {
        HomeView(viewModel: self.viewModel)
    }
    
    private var viewModel: HomeViewModel {
        HomeViewModel(navigationManager: navigationManager)
    }

    // MARK: - Public Functions
    
    func preview() -> some View {
        view
    }
}


