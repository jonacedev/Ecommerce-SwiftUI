


import Combine
import Foundation

final class FavoritesViewModel: BaseViewModel {

    // MARK: - Properties

    private let wireframe: FavoritesWireframe

    // MARK: - Init

    init(wireframe: FavoritesWireframe) {
        self.wireframe = wireframe
        super.init()
    }

    // MARK: - Private Functions

    func onAppear() {
       //getAllInfo()
    }
}
