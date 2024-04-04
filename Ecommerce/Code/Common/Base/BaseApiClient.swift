//
//  BaseApiClient.swift
//  PokeApp
//
//  Created by Jonathan Onrubia Solis on 20/3/24.
//

import UIKit
import Alamofire
import Combine

class BaseAPIClient {

    private lazy var sesionManager = Session(configuration: URLSessionConfiguration.default)
    private var isReachable = true
    private let net = NetworkReachabilityManager()

    init() {
        startListenerReachability()
    }

    // MARK: - Public method

    func handler(error: Error?) -> BaseError {
        if isReachable == false { return .noInternetConnection }
        return .generic
    }

    func requestPublisher<T: Decodable>(path: String,
                                        queryItems: [URLQueryItem]? = nil,
                                        method: HTTPMethod = .get,
                                        headers: HTTPHeaders,
                                        parameters: Parameters? = nil,
                                        encoding: ParameterEncoding = JSONEncoding.default,
                                        type: T.Type = T.self) -> AnyPublisher<T, BaseError> {

        let url = URL(string: Environment.shared.baseURL)!

        var urlComponents = URLComponents(url: url.appendingPathComponent(path), resolvingAgainstBaseURL: true)!
        urlComponents.queryItems = queryItems
        
        var validStatusCode = [200, 300]
        print("\n-->> Request --->\n \(urlComponents)\n\(parameters?.convertToString() ?? "")")

        return sesionManager.request(urlComponents.url!, method: method, parameters: parameters, encoding: encoding, headers: headers)
            .validate(statusCode: validStatusCode)
            .publishDecodable(type: T.self, emptyResponseCodes: [200, 204, 205])
            .tryMap { response in
                if let data =  response.data, let JSONString = String(data: data, encoding: .isoLatin2) {
                    print("\n-->> Response --->\n\(response.response.debugDescription)\n\(JSONString)")
                } else {
                    print("\n-->> Response --->\n ", response.response.debugDescription)
                }

                switch response.result {
                case let .success(result):
                    return result
                case let .failure(error):
                    throw error
                }
            }
            .mapError {[weak self] error in
                guard let self = self else { return .generic }
                return self.handler(error: error)
            }
            .eraseToAnyPublisher()
    }

    func setBaseHeaders(_ values: [String: String]) -> HTTPHeaders {
        return HTTPHeaders(values.map { (key, value) in
            HTTPHeader(name: key, value: value)
        })
    }

    func setAuthHeaders(_ values: [String: String]) -> HTTPHeaders {
        var headers = setBaseHeaders(values)
        let cache = SecuredCache()
        headers.add(HTTPHeader(name: SecuredCacheKey.authToken.name, value: cache.authToken ?? ""))
        return headers
    }

    // MARK: - Private Method

    private func saveHeaderToken(headers: [AnyHashable: Any]?) {
        if let authToken = headers?[SecuredCacheKey.authToken.name] as? String {
            SecuredCache.saveAuthToken(authToken: authToken)
        }
    }

    private func startListenerReachability() {
        net?.startListening(onUpdatePerforming: {[weak self] status in
            self?.isReachable = status != .unknown && status != .notReachable
        })
    }
}
