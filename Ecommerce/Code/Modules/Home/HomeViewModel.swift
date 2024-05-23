


import Combine
import Foundation

final class HomeViewModel: BaseViewModel {
    
    // MARK: - Properties
    
    @Published var searchText: String = ""
    private var navigationManager: any NavigationManagerProtocol
    
    init(navigationManager: any NavigationManagerProtocol) {
        self.navigationManager = navigationManager
    }

    // MARK: - Private Functions

    func onAppear() { }
    
    func goDetail(product: ProductModel) {
        navigationManager.push(.productDetail(product: product))
    }
}
