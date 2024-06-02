

import SwiftUI

final class ProductDetailWireframe {

    private var product: Product?
    private var navigationManager: any NavigationManagerProtocol
    
    init(navigationManager: any NavigationManagerProtocol, product: Product?) {
        self.navigationManager = navigationManager
        self.product = product
    }
    
    var view: ProductDetailView {
        ProductDetailView(viewModel: self.viewModel)
    }
    
    private var viewModel: ProductDetailViewModel {
        let viewModel = ProductDetailViewModel(navigationManager: navigationManager, dataManager: dataManager)
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


