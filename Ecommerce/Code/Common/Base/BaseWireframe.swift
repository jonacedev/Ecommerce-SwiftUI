//
//  BaseWireframe.swift
//
//  Created by Jonathan Onrubia Solis on 20/3/24.

import UIKit
import SwiftUI

class BaseWireframe {

    var navigator: UINavigationController?

    init(navigator: UINavigationController? = nil) {
        self.navigator = navigator
    }

    open func viewController() -> UIViewController? {
        return nil
    }

    func push(viewController: UIViewController?) {
        if let vc = viewController {
            navigator?.show(vc, sender: nil)
        }
    }

    func presentModal(viewController: UIViewController?, isFullScreen: Bool = false) {
        if let vc = viewController {
            if isFullScreen {
                vc.modalPresentationStyle = .fullScreen
            }
            navigator?.present(vc, animated: true)
        }
    }
    
    func present(viewController: UIViewController?) {
        if let vc = viewController {
            navigator?.setViewControllers([vc], animated: false)
        }
    }

    func back() {
        navigator?.popViewController(animated: true)
    }

    func popToRoot() {
        navigator?.popToRootViewController(animated: true)
    }
}

