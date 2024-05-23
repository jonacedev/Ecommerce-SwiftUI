//
//  LaunchWireframe.swift
//
//  Created by Jonathan Onrubia Solis on 20/3/24.
//

import Foundation
import SwiftUI

final class LaunchWireframe {

    private var navigationManager: NavigationManager?
    
    init(navigationManager: NavigationManager?) {
        self.navigationManager = navigationManager
    }
    
    var view: LaunchView {
        LaunchView(viewModel: self.viewModel)
    }
    
    private var viewModel: LaunchViewModel {
        LaunchViewModel(navigationManager: navigationManager)
    }

    // MARK: - Public Functions
    
    func preview() -> some View {
        view
    }
}
