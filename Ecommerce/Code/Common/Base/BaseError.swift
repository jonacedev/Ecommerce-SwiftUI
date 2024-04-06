//
//  BaseError.swift
//
//  Created by Jonathan Onrubia Solis on 20/3/24.
//

import Foundation

enum ErrorType {
    case fullScreen(String)
    case alert(String)
    case form(String)
}

enum BaseError: Error {
    case generic
    case noInternetConnection
    case tokenExpired
    case unauthorized

    func errorDescription() -> DescriptionError {
        var descriptionError: DescriptionError

        switch self {
        case .generic:
            descriptionError = DescriptionError(title: "popup_error_services_title".localized,
                                                     description: "popup_error_services_message".localized,
                                                     icon: "ic_alert",
                                                     button1: "general_accept".localized)
        case .noInternetConnection:
            descriptionError = DescriptionError(title: "popup_default_title".localized,
                                                     description: "general_error_no_internet".localized,
                                                     icon: "ic_alert",
                                                     button1: "general_accept".localized)
        case .unauthorized:
            descriptionError = DescriptionError(title: "login_unauthorized".localized,
                                                     description: "".localized,
                                                     icon: "ic_close_circle",
                                                     button1: "general_accept".localized)

        case .tokenExpired:
            descriptionError = DescriptionError(title: "general_sesion_expired".localized,
                                                     description: "",
                                                     icon: "ic_close_circle",
                                                     button1: "general_accept".localized)
        }

        return descriptionError
    }
}

struct DescriptionError {
    var title: String
    var description: String
    var icon: String
    var button1: String
    var button2: String

    init(title: String, description: String, icon: String = "", button1: String = "", button2: String = "") {
        self.title = title
        self.description = description
        self.icon = icon
        self.button1 = button1
        self.button2 = button2
    }
}
