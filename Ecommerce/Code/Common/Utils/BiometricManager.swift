//
//  BiometricIdManager.swift
//  PokeApp
//
//  Created by Jonathan Onrubia Solis on 21/3/24.
//

import Foundation
import LocalAuthentication

enum BiometricIDAccessState: Int {
    case inactive = 0
    case active = 1
}

enum BiometricType {
    case none
    case touchID
    case faceID

    var description: String {
        switch self {
        case .touchID: return "touch_id".localized
        case .faceID: return "face_id".localized
        default: return ""
        }
    }

    var iconName: String {
        switch self {
        case .touchID: return "ic_touch_id"
        case .faceID: return "ic_face_id"
        default: return ""
        }
    }
}

final class BiometricIDManager {

    private let context: LAContext
    private var defaultsCache = UserDefaultsCache()
    private var securedCache = SecuredCache()

    // MARK: Public variables

    var biometricType: BiometricType {
        guard canEvaluatePolicy() else { return .none }
        return getBiometric()
    }

    func getBiometric() -> BiometricType {
        switch context.biometryType {
        case .none: return .none
        case .faceID: return .faceID
        case .touchID: return .touchID
        default: return .none
        }
    }

    var isAvailable: Bool {
        return biometricType != .none
    }

    // MARK: Lifecycle

    init(context: LAContext = LAContext()) {
        self.context = context
        self.context.localizedFallbackTitle = "" // This makes the fallback password option unavailable, what a shitty api...
    }

    // MARK: Public methods

    func askForBiometricIdAuthentication(reason: String, success: @escaping () -> Void, failure: @escaping (Error?) -> Void) {
        guard biometricType != .none else {
            failure(LAError.invalidContext as? Error)
            return
        }

        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { (validFingerprint, error) in
            if validFingerprint {
                DispatchQueue.main.async(execute: success)
            } else {
                switch error {
                case LAError.authenticationFailed?: break
                case LAError.userCancel?: break
                case LAError.biometryNotAvailable?: break
                case LAError.biometryNotEnrolled?: break
                case LAError.biometryLockout?: break
                default: break
                }

                DispatchQueue.main.async { failure(error) }
            }
        }
    }

    // MARK: Private methods

    private func canEvaluatePolicy() -> Bool {
        return context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
    }

    private func checkDomainState() -> Bool {
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) {
            if let domainState = context.evaluatedPolicyDomainState {
                if let decodedString = String(data: domainState.base64EncodedData(), encoding: .utf8) {
                    if securedCache.biometricDomainState == nil {
                        securedCache.biometricDomainState = decodedString
                        return true
                    } else {
                        // Check if somethings is changing
                        guard securedCache.biometricDomainState == decodedString else {
                            // disable all biometric
                            disableBiometric()
                            return false
                        }
                        return true
                    }
                }
            }
        }
        return false
    }

    func disableBiometric() {
        defaultsCache.biometricIDAccesState = .inactive
        securedCache.biometricDomainState = nil
    }
}
