


import Combine
import Foundation

enum TabSelection: Int {
    case home = 0
    case favorites = 1
    case checkout = 2
}

final class MainTabBarViewModel: BaseViewModel {
    
    private var navigationManager: NavigationManager?
    
    init(navigationManager: NavigationManager?) {
        self.navigationManager = navigationManager
    }

    // MARK: - Properties
    
    @Published var tabSelection: Int = TabSelection.home.rawValue
    lazy var vwHome: HomeView = HomeWireframe(navigationManager: navigationManager).view
    lazy var vwFavorites: FavoritesView = FavoritesWireframe(navigationManager: navigationManager).view
    lazy var vwCheckout: CheckoutView = CheckoutWireframe(navigationManager: navigationManager).view

    // MARK: - Private Functions

    func onAppear() { }
    
    func readyTab() {
        tabSelection = tabSelection
    }
}
