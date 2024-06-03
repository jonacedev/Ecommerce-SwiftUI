//
//  BaseApiClient.swift
//  Ecommerce
//
//  Created by Jonathan Miguel Onrubia Solis on 2/6/24.
//

import Foundation
import Combine

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
}

struct ApiError: Decodable {
    let success: Bool?
    let message: String?
}

class BaseApiClient {
    
    func requestPublisher<T: Decodable>(
        path: String?,
        queryItems: [URLQueryItem]? = nil,
        method: HTTPMethod = .get,
        parameters: [String: Any]? = nil,
        headers: [String: String]? = nil
    ) -> AnyPublisher<T, BaseError> {
        
        let baseUrl = Environment.shared.baseURL
        guard let path = path, let urlAbsolute = URL(string: baseUrl)?.appendingPathComponent(path) else {
            return Fail(error: BaseError.generic).eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: urlAbsolute)
        request.httpMethod = method.rawValue
        
        // MARK: - Set headers
        if let headers = headers {
            request.allHTTPHeaderFields = headers
        } else {
            defaultHeaders().forEach { key, value in
                request.addValue(value, forHTTPHeaderField: key)
            }
        }
       
        // MARK: - Set parameters
        if let parameters = parameters {
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters)
            } catch {
                return Fail(error: BaseError.generic).eraseToAnyPublisher()
            }
        }
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .mapError{ _ in BaseError.generic }
            .flatMap { output in
                guard let httpResponse = output.response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    return Fail<T, BaseError>(error: self.handleError(data: output.data)).eraseToAnyPublisher()
                }
                return Just(output.data)
                    .decode(type: T.self, decoder: JSONDecoder())
                    .mapError { _ in BaseError.generic }
                    .eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
    
    private func handleError(data: Data) -> BaseError {
        if let apiError = try? JSONDecoder().decode(ApiError.self, from: data) {
            return BaseError.api(apiError)
        } else {
            return BaseError.generic
        }
    }
    
    func defaultHeaders() -> [String: String] {
               
        let ApiKey = ProcessInfo.processInfo.environment["API_KEY"] ?? ""
        let headers = [
            "content-type": "application/json",
            "api-key": ApiKey
        ]
        
        return headers
    }
}
