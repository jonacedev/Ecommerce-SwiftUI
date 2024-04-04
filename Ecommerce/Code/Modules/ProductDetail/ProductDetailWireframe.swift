

import SwiftUI

final class ProductDetailWireframe: BaseWireframe {

    // MARK: - Private Functions
    
    var product: ProductModel?
    
    var view: ProductDetailView {
        ProductDetailView(viewModel: self.viewModel)
    }
    
    private var viewModel: ProductDetailViewModel {
        let viewModel = ProductDetailViewModel(wireframe: self)
        if let product {
            viewModel.set(product: product)
        }
        return viewModel
    }
    
    internal override func viewController() -> ProductDetailViewController {
        return ProductDetailViewController(root: view)
    }

    final class ProductDetailViewController: BaseViewController <ProductDetailView> {
        init(root: ProductDetailView) {
            super.init(rootView: root)
        }

        deinit {print("\(String(describing: self)): Deinit called")}
        @objc required dynamic init?(coder aDecoder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    }

    // MARK: - Public Functions
    
    func preview() -> some View {
        view
    }

    func push() {
        super.push(viewController: viewController())
    }
    
    func goBack() {
        back()
    }
  
}


