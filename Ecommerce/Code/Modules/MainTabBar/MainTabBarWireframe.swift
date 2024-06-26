

import SwiftUI

final class MainTabBarWireframe {
    
    private var rootManager: RootManager
    
    init(rootManager: RootManager) {
        self.rootManager = rootManager
    }

    // MARK: - Private Functions
    
    var view: MainTabBarView {
        MainTabBarView(viewModel: self.viewModel)
    }
    
    private var viewModel: MainTabBarViewModel {
        MainTabBarViewModel(rootManager: rootManager)
    }

    // MARK: - Public Functions
    
    func preview() -> some View {
        view
    }

}


