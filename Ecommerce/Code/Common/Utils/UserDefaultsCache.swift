//
//  UserDefaultsCache.swift
//  PokeApp
//
//  Created by Jonathan Onrubia Solis on 20/3/24.
//

import Foundation

enum UserDefaultsCacheKey: String {
    case keyIsFirstTime = "isFirstTime"
    case keyRememberUser = "rememberUser"
    case biometricIDAccessState = "biometricIDAccessState"
    case shouldShowBiometricIDActivation = "shouldShowBiometricsIDActivation"
    case keyIsFirstTimeBiometric = "isFirstTimeBiometric"
    case keyAccessBiometricLogin = "accessBiometricLogin"
   

    var key: String { return rawValue }
}

struct UserDefaultsCache {
    private let userDefaults: UserDefaults

    init(userDefaults: UserDefaults = UserDefaults.standard) {
        self.userDefaults = userDefaults
    }

    // MARK: Retrieve overloads

    func retrieve<E: Codable>(forKey cacheKey: UserDefaultsCacheKey) -> E? {
        guard let data = userDefaults.data(forKey: cacheKey.key),
              let wrapped = try? JSONDecoder().decode(Dictionary<String, E>.self, from: data),
              let unwrapped = unwrapDict(wrapped, withKey: cacheKey) else { return nil }
        return unwrapped
    }

    func retrieve<E>(forKey cacheKey: UserDefaultsCacheKey) -> E? where E: RawRepresentable, E.RawValue: Codable {
        guard let rawValue: E.RawValue = retrieve(forKey: cacheKey),
              let element = E.init(rawValue: rawValue) else { return nil }
        return element
    }

    // MARK: Persist overloads

    func persist<E: Codable>(_ object: E, forKey cacheKey: UserDefaultsCacheKey) {
        let wrapped = wrapInDict(object, withKey: cacheKey)

        guard let data = try? JSONEncoder().encode(wrapped) else {
            print("Could not persist codable object")
            return
        }

        userDefaults.set(data, forKey: cacheKey.key)
    }

    func persist<E>(_ object: E, forKey cacheKey: UserDefaultsCacheKey) where E: RawRepresentable, E.RawValue: Codable {
        persist(object.rawValue, forKey: cacheKey)
    }

    // MARK: Remove overloads

    func remove(forKey cacheKey: UserDefaultsCacheKey) {
        userDefaults.removeObject(forKey: cacheKey.key)
    }

    // MARK: Private methods

    private func wrapInDict<E: Codable>(_ object: E, withKey key: UserDefaultsCacheKey) -> [String: E] {
        return [key.key: object]
    }

    private func unwrapDict<E: Codable>(_ object: [String: E], withKey key: UserDefaultsCacheKey) -> E? {
        return object[key.key]
    }
}

extension UserDefaultsCache {
    
    var isFirstTime: Bool {
        get { return retrieve(forKey: .keyIsFirstTime) ?? true }
        set { persist(newValue, forKey: .keyIsFirstTime) }
    }
    
    var shouldRememberUser: Bool {
        get { return retrieve(forKey: .keyRememberUser) ?? false }
        set { persist(newValue, forKey: .keyRememberUser) }
    }
    
    func biometricStatusIsActive() -> Bool {
        return biometricIDAccesState == .active
    }
    
    var biometricIDAccesState: BiometricIDAccessState {
        get { return retrieve(forKey: .biometricIDAccessState) ?? .inactive }
        set { persist(newValue, forKey: .biometricIDAccessState) }
    }
    
    // Should show active bimetric
    var shouldShowBiometricIDActivation: Bool {
        get { return retrieve(forKey: .shouldShowBiometricIDActivation) ?? true }
        set { persist(newValue, forKey: .shouldShowBiometricIDActivation) }
    }
    
    // Is First Time init App show Landing
    var isFirstTimeBiometric: Bool {
        get { return retrieve(forKey: .keyIsFirstTimeBiometric) ?? true }
        set { persist(newValue, forKey: .keyIsFirstTimeBiometric) }
    }
    
    // Save is access with biometric Login
    var accessBiometricLogin: Bool {
        get { return retrieve(forKey: .keyAccessBiometricLogin) ?? false }
        set { persist(newValue, forKey: .keyAccessBiometricLogin) }
    }
}
