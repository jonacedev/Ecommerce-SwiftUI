

import SwiftUI

final class HomeWireframe {

    private var navigationManager: NavigationManager
    private var rootManager: RootManager

    init(navigationManager: NavigationManager, rootManager: RootManager) {
        self.navigationManager = navigationManager
        self.rootManager = rootManager
    }

    var view: HomeView {
        HomeView(viewModel: self.viewModel)
    }

    private var viewModel: HomeViewModel {
        HomeViewModel(navigationManager: navigationManager, rootManager: rootManager, dataManager: dataManager)
    }

    private var dataManager: HomeDataManager {
        HomeDataManager(productsAPI: productsAPI, favoritesAPI: favoritesAPI, usersAPI: usersAPI)
    }

    private var productsAPI: ProductsAPI {
        ProductsAPI()
    }
    
    private var favoritesAPI: FavoritesAPI {
        FavoritesAPI()
    }

    private var usersAPI: UsersAPI {
        UsersAPI()
    }

    // MARK: - Public Functions

    func preview() -> some View {
        view
    }
}


