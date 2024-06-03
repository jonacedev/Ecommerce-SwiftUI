//
//  Enviroment.swift
//  TemplateMVVM
//
//  Created by Jonathan Onrubia Solis on 16/8/22.
//

import UIKit

final class Environment {

    // MARK: - Constant

    private let typeFileEnvironment = "plist"
    private let nameFileEnvironment = "Config"
    private let keyEnvironmentURL = "baseURL"
  
    // MARK: - Shared Instance

    static let shared = Environment()

    // MARK: - Init
    
    private init() {
        if let path = Bundle.main.path(forResource: nameFileEnvironment, ofType: typeFileEnvironment) {
            plistEnvironment = NSDictionary(contentsOfFile: path) as? [String: AnyObject]
        }
    }
    
    // MARK: - Properties
    private var plistEnvironment: [String: Any]?

    var baseURL: String {
        guard let baseUrl =  plistEnvironment?[keyEnvironmentURL] as? String else { fatalError("Invalid baseURL at plist") }
        return baseUrl
    }
 
}
