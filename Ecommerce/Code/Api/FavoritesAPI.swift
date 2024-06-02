//
//  FavoritesAPI.swift
//  Ecommerce
//
//  Created by Jonathan Miguel Onrubia Solis on 2/6/24.
//

import Combine

class FavoritesAPI: BaseApiClient {
    
    func getFavoritesList() -> AnyPublisher<FavoritesModel, BaseError> {
        let path = "/favorites/getFavorites"
        return requestPublisher(path: path,
                                method: .get)
    }
    
    func addFavorite(id: String) -> AnyPublisher<ApiError, BaseError> {
        let path = "/favorites/addFavorite/\(id)"
        return requestPublisher(path: path,
                                method: .post)
    }
    
    func deleteFavorite(id: String) -> AnyPublisher<ApiError, BaseError> {
        let path = "/favorites/removeFavorite/\(id)"
        return requestPublisher(path: path,
                                method: .delete)
    }
    
}
