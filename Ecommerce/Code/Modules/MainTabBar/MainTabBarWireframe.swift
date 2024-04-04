

import SwiftUI

final class MainTabBarWireframe: BaseWireframe {

    // MARK: - Private Functions
    
    var view: MainTabBarView {
        MainTabBarView(viewModel: self.viewModel)
    }
    
    private var viewModel: MainTabBarViewModel {
        return MainTabBarViewModel(wireframe: self)
    }
    
    internal override func viewController() -> MainTabBarViewController {
        return MainTabBarViewController(root: view)
    }

    final class MainTabBarViewController: BaseViewController <MainTabBarView> {
        init(root: MainTabBarView) {
            super.init(rootView: root)
        }

        deinit {print("\(String(describing: self)): Deinit called")}
        @objc required dynamic init?(coder aDecoder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    }

    // MARK: - Public Functions
    
    func present() {
        super.present(viewController: viewController())
    }
    
    func preview() -> some View {
        view
    }

}


