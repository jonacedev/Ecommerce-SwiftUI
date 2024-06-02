

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
        HomeViewModel(navigationManager: navigationManager, dataManager: dataManager)
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


