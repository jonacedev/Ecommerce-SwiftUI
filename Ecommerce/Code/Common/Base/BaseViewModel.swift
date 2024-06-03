//
//  BaseViewModel.swift
//
//  Created by Jonathan Onrubia Solis on 20/3/24.
//

import Combine
import UIKit

class BaseViewModel: ObservableObject {
    
    // MARK: - Properties
    
    var cancellables = Set<AnyCancellable>()
    var userDefaults = UserDefaultsCache()
    var navigationManager: any NavigationManagerProtocol
    
    init(navigationManager: any NavigationManagerProtocol) {
        self.navigationManager = navigationManager
    }
    
    
    func manage(completion: Subscribers.Completion<BaseError>?) {
        hideLoading()
        switch completion {
        case .failure(let baseError):
            var action: () -> Void
            action = { [weak self] in
                self?.hideAlert()
            }
            
            showAlert(alert: BaseAlert.Model(image: baseError.errorDescription().icon,
                                             title: baseError.errorDescription().title,
                                             description: baseError.errorDescription().description,
                                             buttonText1: baseError.errorDescription().button1,
                                             feedback: .error,
                                             action1: action))
        default: break
        }
    }
    
    func showLoading() {
        navigationManager.showLoading()
    }
    
    func hideLoading() {
        navigationManager.hideLoading()
    }
    
    func showAlert(alert: BaseAlert.Model) {
        navigationManager.showAlert(alert: alert)
    }
    
    func hideAlert() {
        navigationManager.hideAlert()
    }
    
}

