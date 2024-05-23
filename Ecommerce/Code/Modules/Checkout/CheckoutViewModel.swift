


import Combine
import Foundation

final class CheckoutViewModel: BaseViewModel {
    
    private var navigationManager: NavigationManager?
    
    init(navigationManager: NavigationManager?) {
        self.navigationManager = navigationManager
    }

    // MARK: - Private Functions
    
    func goDetail(product: ProductModel) {
        navigationManager?.push(.productDetail(product: product))
    }
}
