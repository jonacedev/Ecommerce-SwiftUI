

import SwiftUI

final class MainTabBarWireframe {
    
    private var navigationManager: NavigationManager?
    
    init(navigationManager: NavigationManager?) {
        self.navigationManager = navigationManager
    }

    // MARK: - Private Functions
    
    var view: MainTabBarView {
        MainTabBarView(viewModel: self.viewModel)
    }
    
    private var viewModel: MainTabBarViewModel {
        MainTabBarViewModel(navigationManager: navigationManager)
    }

    // MARK: - Public Functions
    
    func preview() -> some View {
        view
    }

}


