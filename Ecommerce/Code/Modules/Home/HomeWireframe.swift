

import SwiftUI

final class HomeWireframe: BaseWireframe {

    // MARK: - Private Functions
    
    var view: HomeView {
        HomeView(viewModel: self.viewModel)
    }
    
    private var viewModel: HomeViewModel {
        return HomeViewModel(wireframe: self)
    }
    
    internal override func viewController() -> HomeViewController {
        return HomeViewController(root: view)
    }

    final class HomeViewController: BaseViewController <HomeView> {
        init(root: HomeView) {
            super.init(rootView: root)
        }

        deinit {print("\(String(describing: self)): Deinit called")}
        @objc required dynamic init?(coder aDecoder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    }

    // MARK: - Public Functions
    
    func preview() -> some View {
        view
    }
    
    func present() {
        super.present(viewController: viewController())
    }
    
    func goToDetail(product: ProductModel) {
        let productWireframe = ProductDetailWireframe(navigator: navigator)
        productWireframe.product = product
        productWireframe.push()
    }
    
}


