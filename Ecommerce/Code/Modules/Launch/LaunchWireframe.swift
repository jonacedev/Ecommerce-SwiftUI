//
//  LaunchWireframe.swift
//
//  Created by Jonathan Onrubia Solis on 20/3/24.
//

import Foundation
import SwiftUI

final class LaunchWireframe {
    
    private var rootManager: RootManager
    
    init(rootManager: RootManager) {
        self.rootManager = rootManager
    }
    
    var view: LaunchView {
        LaunchView(viewModel: self.viewModel)
    }
    
    private var viewModel: LaunchViewModel {
        LaunchViewModel(rootManager: rootManager)
    }
    
    // MARK: - Public Functions
    
    func preview() -> some View {
        view
    }
}
