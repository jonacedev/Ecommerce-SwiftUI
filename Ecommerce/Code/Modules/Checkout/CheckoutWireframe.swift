

import SwiftUI

final class CheckoutWireframe: BaseWireframe {

    // MARK: - Private Functions
    
    var view: CheckoutView {
        CheckoutView(viewModel: self.viewModel)
    }
    
    private var viewModel: CheckoutViewModel {
        return CheckoutViewModel(wireframe: self)
    }
    
    internal override func viewController() -> CheckoutViewController {
        return CheckoutViewController(root: view)
    }

    final class CheckoutViewController: BaseViewController <CheckoutView> {
        init(root: CheckoutView) {
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


