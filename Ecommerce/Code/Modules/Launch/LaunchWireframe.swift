//
//  LaunchWireframe.swift
//
//  Created by Jonathan Onrubia Solis on 20/3/24.
//

import Foundation
import SwiftUI

final class LaunchWireframe: BaseWireframe {

    // MARK: - Private Functions
    
    var view: LaunchView {
        LaunchView(viewModel: self.viewModel)
    }
    
    private var viewModel: LaunchViewModel {
        return LaunchViewModel(wireframe: self)
    }
    
    internal override func viewController() -> LaunchViewController {
        return LaunchViewController(root: view)
    }

    internal final class LaunchViewController: BaseViewController<LaunchView> {
        init(root: LaunchView) {
            super.init(rootView: root)
        }

        deinit {print("\(String(describing: self)): Deinit called")}
        @objc required dynamic init?(coder aDecoder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    }

    // MARK: - Public Functions
    
    func preview() -> some View {
        return view
    }

    func present() {
        super.present(viewController: viewController())
    }
    
    func goHome() {
        MainTabBarWireframe(navigator: navigator).present()
    }
}
