

import SwiftUI

final class FavoritesWireframe {

    private var navigationManager: NavigationManager
    private var rootManager: RootManager
    
    init(navigationManager: NavigationManager, rootManager: RootManager) {
        self.navigationManager = navigationManager
        self.rootManager = rootManager
    }

    // MARK: - Private Functions
    
    var view: FavoritesView {
        FavoritesView(viewModel: self.viewModel)
    }
    
    private var viewModel: FavoritesViewModel {
        FavoritesViewModel(navigationManager: navigationManager, rootManager: rootManager, dataManager: dataManager)
    }
    
    private var dataManager: FavoritesDataManager {
        FavoritesDataManager(favoritesAPI: favoritesAPI)
    }
    
    private var favoritesAPI: FavoritesAPI {
        FavoritesAPI()
    }

    // MARK: - Public Functions
    
    func preview() -> some View {
        view
    }
}


