


import Combine
import Foundation

enum TabSelection: Int {
    case home = 0
    case favorites = 1
    case checkout = 2
}

final class MainTabBarViewModel: BaseViewModel {

    // MARK: - Properties
    
    @Published var tabSelection: Int = TabSelection.home.rawValue
    lazy var vwHome: HomeView = HomeWireframe(navigationManager: navigationManager).view
    lazy var vwFavorites: FavoritesView = FavoritesWireframe(navigationManager: navigationManager).view
    //lazy var vwCheckout: CheckoutView = CheckoutWireframe(navigationManager: navigationManager).view
    
    override init(navigationManager: any NavigationManagerProtocol) {
        super.init(navigationManager: navigationManager)
    }

    // MARK: - Private Functions

    func onAppear() { }
    
    func readyTab() {
        tabSelection = tabSelection
    }
}
