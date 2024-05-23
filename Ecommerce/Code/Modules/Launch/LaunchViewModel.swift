//
//  LaunchViewModel.swift
//
//  Created by Jonathan Onrubia Solis on 20/3/24.
//

import Combine
import Foundation

final class LaunchViewModel: BaseViewModel {

    // MARK: - Properties

    private var navigationManager: any NavigationManagerProtocol
    
    init(navigationManager: any NavigationManagerProtocol) {
        self.navigationManager = navigationManager
    }

    // MARK: - Private Functions

    private func checkDevice() {
        if isSimulator() {
            goFirstScreen()
        } else {
            if !DeviceInfo.isJailbreak() {
                goFirstScreen()
            } else {
                jailbreakAlert()
            }
        }
    }

    private func jailbreakAlert() {
        alert = BaseAlert.Model(image: "ic_close_circle",
                                title: "rooted_title".localized,
                                description: "rooted_description".localized,
                                buttonText1: "general_accept".localized, action1: {
            exit(0)
        })
    }

    private func goFirstScreen() {
        if userDefaults.shouldRememberUser == true {
            goHome()
        } else {
            //goLogin()
        }
    }
    
    func goHome() {
        navigationManager.currentRoot = .home
    }

    // MARK: -  Check if is a simulator
    
    private func isSimulator() -> Bool {
        return TARGET_OS_SIMULATOR != 0
    }

}

