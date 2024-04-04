//
//  SecuredCache.swift
//  PokeApp
//
//  Created by Jonathan Onrubia Solis on 20/3/24.
//

import Foundation
import KeychainAccess

enum SecuredCacheKey: String {
    case authToken
    case biometricDomainState

    var name: String {
        switch self {
        case .authToken: return "auth-Token"
        case .biometricDomainState: return "biometricDomainState"
        }
    }

    var value: String { return rawValue }
}

/// A secured key-value cache using the system's keychain.
/// - Todo: Allow to store more types than just Strings

struct SecuredCache {
    private let defaultKeychain: Keychain = Keychain(service: Bundle.main.bundleIdentifier!)

    // We encapsulate all the remove funcitonality in one method to avoid creating bugs
    func removeProperty(key: SecuredCacheKey) {
        defaultKeychain[string: key.value] = nil
    }

    // We do not allow setting nils to separate all setting functionality from the remove functionality
    private func setProperty(_ property: String?, forKey: SecuredCacheKey) {
        defaultKeychain[string: forKey.value] = property
    }

    private func setProperty<E: Codable>(_ property: E, forKey: SecuredCacheKey) {
        let jsonDataBase64String = try? JSONEncoder().encode(property).base64EncodedString()
        setProperty(jsonDataBase64String, forKey: forKey)
    }

    private func getProperty(key: SecuredCacheKey) -> String? {
        return defaultKeychain[string: key.value]
    }

    private func getProperty<E: Codable>(key: SecuredCacheKey) -> E? {
        let objectInBase64String = getProperty(key: key)

        return objectInBase64String.flatMap { Data(base64Encoded: $0) }
                                   .flatMap { try? JSONDecoder().decode(E.self, from: $0) }
    }
}

extension SecuredCache {

    func removeDataUser() {
        removeProperty(key: .authToken)
    }

    // MARK: - X-Auth-Token

    var authToken: String? {
        get { return getProperty(key: .authToken) }
        set { setProperty(newValue, forKey: .authToken) }
    }
    
    var biometricDomainState: String? {
        get { return getProperty(key: .biometricDomainState) }
        set { setProperty(newValue, forKey: .biometricDomainState) }
    }

    static func saveAuthToken(authToken: String?) {
        var cache = SecuredCache()
        cache.authToken = authToken
    }

    static func deleteAuthToken() {
        var cache = SecuredCache()
        cache.authToken = nil
    }
}
