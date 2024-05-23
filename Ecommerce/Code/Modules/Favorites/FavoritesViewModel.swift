


import Combine
import Foundation

final class FavoritesViewModel: BaseViewModel {

    private var navigationManager: NavigationManager?
    
    init(navigationManager: NavigationManager?) {
        self.navigationManager = navigationManager
    }

    // MARK: - Functions

    func onAppear() { }
    
    func goDetail(product: ProductModel) {
        navigationManager?.push(.productDetail(product: product))
    }
}
