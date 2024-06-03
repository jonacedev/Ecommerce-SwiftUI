

import SwiftUI

final class ProductDetailWireframe {

    private var product: Product?
    private var navigationManager: any NavigationManagerProtocol
    private var shoppingCartManager: ShoppingCartManager
    
    init(navigationManager: any NavigationManagerProtocol, shoppingCartManager: ShoppingCartManager, product: Product?) {
        self.navigationManager = navigationManager
        self.shoppingCartManager = shoppingCartManager
        self.product = product
    }
    
    var view: ProductDetailView {
        ProductDetailView(viewModel: self.viewModel)
    }
    
    private var viewModel: ProductDetailViewModel {
        let viewModel = ProductDetailViewModel(navigationManager: navigationManager, shoppingCartManager: shoppingCartManager, dataManager: dataManager)
        if let product { viewModel.set(product: product) }
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
        //self.product = ProductsData.shared.products.first
        return view
    }
}


