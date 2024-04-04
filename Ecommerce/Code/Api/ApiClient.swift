//
//  PokeApi.swift
//  PokeApp
//
//  Created by Jonathan Onrubia Solis on 20/3/24.
//

import Alamofire
import Combine

final class ApiClient: BaseAPIClient {
    
    // MARK: - Shared Instance
    
    static let shared = ApiClient()
    
    // MARK: - Public Functions
    
//    func checkVersion() -> AnyPublisher<CheckVersionResponse, BaseError> {
//        Just(CheckVersionResponse(code: 0, message: "OK"))
//            .setFailureType(to: BaseError.self)
//            .eraseToAnyPublisher()
//    }
       
//    func getUserDetail() -> AnyPublisher<GetUserDetailResponse, BaseError> {
//        let path = "Setting/users/profile"
//        let headers = setAuthHeaders(["Content-Type": "application/json"])
//        
//        return requestPublisher(path: path, method: .get, headers: headers, parameters: nil, encoding: URLEncoding.default, type: GetUserDetailResponse.self)
//    }

}
