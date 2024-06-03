//
//  UsersAPI.swift
//  Ecommerce
//
//  Created by Jonathan Miguel Onrubia Solis on 2/6/24.
//

import Combine

class UsersAPI: BaseApiClient {
    
    func getDefaultUser() -> AnyPublisher<UserModel, BaseError> {
        let path = "/users/getDefaultUser"
        return requestPublisher(path: path,
                                method: .get)
    }
    
}
