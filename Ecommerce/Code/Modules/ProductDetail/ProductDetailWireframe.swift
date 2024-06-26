

import SwiftUI

final class ProductDetailWireframe {

    private var product: Product?
    private var navigationManager: NavigationManager
    private var rootManager: RootManager
    private var shoppingCartManager: ShoppingCartManager
    
    init(navigationManager: NavigationManager, rootManager: RootManager, shoppingCartManager: ShoppingCartManager, product: Product?) {
        self.navigationManager = navigationManager
        self.rootManager = rootManager
        self.shoppingCartManager = shoppingCartManager
        self.product = product
    }
    
    var view: ProductDetailView {
        ProductDetailView(viewModel: self.viewModel)
    }
    
    private var viewModel: ProductDetailViewModel {
        let viewModel = ProductDetailViewModel(navigationManager: navigationManager, rootManager: rootManager, shoppingCartManager: shoppingCartManager, dataManager: dataManager, product: product ?? Product())
        return viewModel
    }
    
    private var dataManager: ProductDetailDataManager {
        ProductDetailDataManager(favoritesAPI: favoritesAPI)
    }
    
    private var favoritesAPI: FavoritesAPI {
        FavoritesAPI()
    }

    // MARK: - Public Functions
    
    func preview() -> some View {
        view
    }
}


