

import SwiftUI

final class ProductDetailWireframe {

    private var product: ProductModel?
    private var navigationManager: NavigationManager?
    
    init(navigationManager: NavigationManager?, product: ProductModel?) {
        self.navigationManager = navigationManager
        self.product = product
    }
    
    var view: ProductDetailView {
        ProductDetailView(viewModel: self.viewModel)
    }
    
    private var viewModel: ProductDetailViewModel {
        let viewModel = ProductDetailViewModel(navigationManager: navigationManager)
        if let product { viewModel.set(product: product) }
        return viewModel
    }

    // MARK: - Public Functions
    
    func preview() -> some View {
        self.product = ProductsData.shared.products.first
        return view
    }
}


