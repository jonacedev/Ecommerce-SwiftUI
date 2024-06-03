


import Combine
import Foundation

enum TabSelection: Int {
    case home = 0
    case favorites = 1
    case checkout = 2
}

final class MainTabBarViewModel: BaseViewModel {

    // MARK: - Properties
    private var shoppingCartManager: ShoppingCartManager
    @Published var tabSelection: Int = TabSelection.home.rawValue
    
    lazy var vwHome: HomeView = HomeWireframe(navigationManager: navigationManager).view
    lazy var vwFavorites: FavoritesView = FavoritesWireframe(navigationManager: navigationManager).view
    lazy var vwCheckout: CheckoutView = CheckoutWireframe(navigationManager: navigationManager, shoppingCartManager: shoppingCartManager).view
    
    init(navigationManager: any NavigationManagerProtocol, shoppingCartManager: ShoppingCartManager) {
        self.shoppingCartManager = shoppingCartManager
        super.init(navigationManager: navigationManager)
    }

    // MARK: - Private Functions
    
    func readyTab() {
        tabSelection = tabSelection
    }
}
