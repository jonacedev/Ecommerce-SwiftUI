


import Combine
import Foundation

final class HomeViewModel: BaseViewModel {
    
    // MARK: - Properties
    
    private var navigationManager: NavigationManager?

    init(navigationManager: NavigationManager?) {
        self.navigationManager = navigationManager
    }

    // MARK: - Private Functions

    func onAppear() { }
    
    func goDetail(product: ProductModel) {
        navigationManager?.push(.productDetail(product: product))
    }
}
