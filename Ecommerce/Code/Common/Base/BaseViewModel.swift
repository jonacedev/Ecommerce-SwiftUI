//
//  BaseViewModel.swift
//  PokeApp
//
//  Created by Jonathan Onrubia Solis on 20/3/24.
//

import Combine
import UIKit

class BaseViewModel: ObservableObject {

    // MARK: - Properties

    var cancellables = Set<AnyCancellable>()
    var securedCache = SecuredCache()
    var userDefaults = UserDefaultsCache()
    //let api = Api.shared
    @Published var alert: BaseAlert.Model?
    @Published var loading: Bool?

    func manage(completion: Subscribers.Completion<BaseError>?, wireframe: BaseWireframe? = nil) {
        hideLoading()
        switch completion {
        case .failure(let baseError):
            var action: () -> Void

            action = {[weak self] in
                self?.alert = nil
            }
            
            alert = BaseAlert.Model(image: baseError.errorDescription().icon,
                                    title: baseError.errorDescription().title,
                                    description: baseError.errorDescription().description,
                                    buttonText1: baseError.errorDescription().button1,
                                    feedback: .error,
                                    action1: action)
        default: break
        }
    }

    func showLoading() {
        loading = true
    }

    func hideLoading() {
        loading = false
    }
    
}

