

import Combine
import Foundation
import SwiftData

final class CheckoutViewModel: BaseViewModel {
    
    @Published var products: [ProductCartModel] = []
    var shoppingCartManager: ShoppingCartManager
    
    init(navigationManager: any NavigationManagerProtocol, shoppingCartManager: ShoppingCartManager) {
        self.shoppingCartManager = shoppingCartManager
        super.init(navigationManager: navigationManager)
        observe()
    }
    
    // MARK: - Private Functions
    
    private func observe() {
        shoppingCartManager.$productsCart
            .receive(on: DispatchQueue.main)
            .sink { [weak self] updatedProducts in
                self?.products = updatedProducts
            }
            .store(in: &cancellables)
    }
    
    // MARK: - Public Functions
    
    func goDetail(product: Product?) {
        guard let product else { return }
        navigationManager.push(.productDetail(product: product))
    }
    
    func submitCart() {
        showLoading()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            self.hideLoading()
            self.shoppingCartManager.removeCart()
            self.showAlert(alert: BaseAlert.Model(description: "alert_success_order".localized, buttonText1: "alert_acept_title".localized, action1: {
                self.hideAlert()
            }))
        })
    }
    
}
