


import Combine
import Foundation

final class ProductDetailViewModel: BaseViewModel {

    // MARK: - Properties
    
    @Published var product: ProductModel?
    @Published var sizeSelected: ClotheSize = .s
    @Published var amountItems: Int = 1
    @Published var finalPrice: Double = 0
    private var productsData = ProductsData.shared
    private var navigationManager: any NavigationManagerProtocol
    
    init(navigationManager: any NavigationManagerProtocol) {
        self.navigationManager = navigationManager
    }

    func set(product: ProductModel) {
        self.product = product
        self.finalPrice = product.price
    }
    
    func showCartSuccessAlert() {
        alert = BaseAlert.Model(description: "alert_add_to_cart_title".localized, buttonText1: "alert_acept_title".localized, action1: {
            self.alert = nil
            self.goBack()
        })
    }
    
    func incrementAmount() {
        amountItems += 1
        finalPrice += product?.price ?? 0
    }
    
    func decrementAmount() {
        if amountItems > 1 {
            amountItems -= 1
            finalPrice -= product?.price ?? 0
        }
    }

    func addProductToCart() {
        let newProduct = ProductCartModel(productId: product?.id ?? 0, finalPrice: finalPrice, amount: amountItems, sizeSelected: sizeSelected)
        productsData.addProductToCart(product: newProduct)
        showCartSuccessAlert()
    }

    func toggleFavorite() {
        product?.isFavorite.toggle()
        if let idx = productsData.products.firstIndex(where: { $0.id == product?.id }) {
            productsData.products[idx].isFavorite.toggle()
        }
    }
    
    func goBack() {
        navigationManager.popToLast()
    }
}
