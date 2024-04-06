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
    
    @Published var alert: BaseAlert.Model?
    @Published var loading: Bool = false
    

    func showLoading() {
        loading = true
    }

    func hideLoading() {
        loading = false
    }
    
}

