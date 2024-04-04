


import Combine
import Foundation

final class ProductDetailViewModel: BaseViewModel {

    // MARK: - Properties

    private let wireframe: ProductDetailWireframe
    @Published var product: ProductModel?
    @Published var isSelected: ClotheSize = .s

    // MARK: - Init

    init(wireframe: ProductDetailWireframe) {
        self.wireframe = wireframe
        super.init()
    }
    
    func set(product: ProductModel) {
        self.product = product
    }

    // MARK: - Private Functions
    
    func showCartSuccessAlert() {
        alert = BaseAlert.Model(description: "Producto añadido al carrito", buttonText1: "Aceptar", action1: {
            self.alert = nil
            self.goBack()
        })
    }
    
    func goBack() {
        wireframe.goBack()
    }
}
