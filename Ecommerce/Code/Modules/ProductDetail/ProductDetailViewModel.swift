


import Combine
import Foundation

final class ProductDetailViewModel: BaseViewModel {

    // MARK: - Properties
    
    @Published var product: ProductModel?
    @Published var isSelected: ClotheSize = .s
    private var navigationManager: NavigationManager?
    
    init(navigationManager: NavigationManager?) {
        self.navigationManager = navigationManager
    }

    func set(product: ProductModel) {
        self.product = product
    }
    
    func showCartSuccessAlert() {
        alert = BaseAlert.Model(description: "alert_add_to_cart_title".localized, buttonText1: "alert_acept_title".localized, action1: {
            self.alert = nil
            self.goBack()
        })
    }
    
    func goBack() {
        navigationManager?.popToLast()
    }
}
