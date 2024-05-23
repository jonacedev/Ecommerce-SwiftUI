


import Combine
import Foundation

final class CheckoutViewModel: BaseViewModel {
    
    private var navigationManager: any NavigationManagerProtocol
    
    init(navigationManager: any NavigationManagerProtocol) {
        self.navigationManager = navigationManager
    }

    // MARK: - Private Functions
    
    func goDetail(product: ProductModel) {
        navigationManager.push(.productDetail(product: product))
    }
}
