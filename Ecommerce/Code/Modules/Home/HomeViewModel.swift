


import Combine
import Foundation

final class HomeViewModel: BaseViewModel {

    // MARK: - Properties

    private let wireframe: HomeWireframe

    // MARK: - Init

    init(wireframe: HomeWireframe) {
        self.wireframe = wireframe
        super.init()
    }

    // MARK: - Private Functions

    func onAppear() {
       //getAllInfo()
    }
    
    func goToDetail(product: ProductModel) {
        wireframe.goToDetail(product: product)
    }
}
