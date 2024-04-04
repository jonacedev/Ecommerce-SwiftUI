//
//  Alamofire+Utils.swift
//  PokeApp
//
//  Created by Jonathan Onrubia Solis on 20/3/24.
//

import Foundation
import Alamofire
import os.log

extension Encodable {
    var dictEncodable: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { return nil }
        return json
    }
}

extension Parameters {
    func convertToString() -> String? {
        if let jsonData = try? JSONSerialization.data(withJSONObject: self, options: []),
           let jsonString = String(data: jsonData, encoding: .utf8) {
           return jsonString
        }
        return nil
    }
}

final class APIHelper {
    static func mapValuesToQueryItems(values: [String: Any?]) -> [URLQueryItem] {
        return values
            .filter { $0.1 != nil }
            .map { (item: (key: String, value: Any?)) -> URLQueryItem in
                URLQueryItem(name: item.key, value: "\(item.value!)")
            }
    }
}
