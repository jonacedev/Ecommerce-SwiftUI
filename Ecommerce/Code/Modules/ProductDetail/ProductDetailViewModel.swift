


import Combine
import Foundation

final class ProductDetailViewModel: BaseViewModel {

    // MARK: - Properties
    
    @Published var product: Product?
    @Published var favorites: [Product] = []
    @Published var sizeSelected: ClotheSize = .s
    @Published var amountItems: Int = 1
    @Published var finalPrice: Double = 0
    
    private var dataManager: ProductDetailDataManager
    
    init(navigationManager: any NavigationManagerProtocol, dataManager: ProductDetailDataManager) {
        self.dataManager = dataManager
        super.init(navigationManager: navigationManager)
    }

    func set(product: Product) {
        self.product = product
        self.finalPrice = product.price ?? 0
    }
    
    func getFavoritesList() {
        showLoading()
        dataManager.getFavoritesList()
            .receive(on: DispatchQueue.main)
            .sink{ [weak self] completion in
                self?.manage(completion: completion)
            } receiveValue: { [weak self] response in
                self?.hideLoading()
                self?.favorites = response.favorites ?? []
            }.store(in: &cancellables)
    }
    
    func productIsFavorite() -> Bool {
        favorites.contains(where: { $0.id == product?.id })
    }
    
    func tapFavorite() {
        showLoading()
        if productIsFavorite() {
            dataManager.deleteFavorite(id: product?.id ?? "")
                .receive(on: DispatchQueue.main)
                .sink{ [weak self] completion in
                    self?.manage(completion: completion)
                } receiveValue: { [weak self] response in
                    self?.hideLoading()
                    self?.updateFavorites(isCurrentlyFavorite: true, id: self?.product?.id)
                }.store(in: &cancellables)
        } else {
            dataManager.addFavorite(id: product?.id ?? "")
                .receive(on: DispatchQueue.main)
                .sink{ [weak self] completion in
                    self?.manage(completion: completion)
                } receiveValue: { [weak self] response in
                    self?.navigationManager.hideLoading()
                    self?.updateFavorites(isCurrentlyFavorite: false, id: self?.product?.id)
                }.store(in: &cancellables)
        }
    }
    
    private func updateFavorites(isCurrentlyFavorite: Bool, id: String?) {
        if isCurrentlyFavorite {
            favorites.removeAll { $0.id == product?.id }
        } else {
            if let product = product {
                favorites.append(product)
            }
        }
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
    
    // MARK: - Add product to swiftData converting to ProductCartModel

//    func addProductToCart() {
//        let newProduct = ProductCartModel(productId: product?.id ?? 0, finalPrice: finalPrice, amount: amountItems, sizeSelected: sizeSelected)
//        productsData.addProductToCart(product: newProduct)
//        showCartSuccessAlert()
//    }
    
//    func showCartSuccessAlert() {
//        navigationManager.showAlert(alert: BaseAlert.Model(description: "alert_add_to_cart_title".localized, buttonText1: "alert_acept_title".localized, action1: {
//            self.navigationManager.hideAlert()
//            self.goBack()
//        }))
//    }
//
    
    func goBack() {
        navigationManager.popToLast()
    }
}
