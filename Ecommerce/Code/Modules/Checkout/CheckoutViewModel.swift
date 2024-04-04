


import Combine
import Foundation

final class CheckoutViewModel: BaseViewModel {

    // MARK: - Properties

    private let wireframe: CheckoutWireframe

    // MARK: - Init

    init(wireframe: CheckoutWireframe) {
        self.wireframe = wireframe
        super.init()
    }

    // MARK: - Private Functions

    func onAppear() {
       //getAllInfo()
    }
}
