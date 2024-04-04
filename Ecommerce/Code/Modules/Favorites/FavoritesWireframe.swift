

import SwiftUI

final class FavoritesWireframe: BaseWireframe {

    // MARK: - Private Functions
    
    var view: FavoritesView {
        FavoritesView(viewModel: self.viewModel)
    }
    
    private var viewModel: FavoritesViewModel {
        return FavoritesViewModel(wireframe: self)
    }
    
    internal override func viewController() -> FavoritesViewController {
        return FavoritesViewController(root: view)
    }

    final class FavoritesViewController: BaseViewController <FavoritesView> {
        init(root: FavoritesView) {
            super.init(rootView: root)
        }

        deinit {print("\(String(describing: self)): Deinit called")}
        @objc required dynamic init?(coder aDecoder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    }

    // MARK: - Public Functions

    func push() {
        navigator?.show(viewController(), sender: nil)
    }
    
    func preview() -> some View {
        view
    }
    

}


