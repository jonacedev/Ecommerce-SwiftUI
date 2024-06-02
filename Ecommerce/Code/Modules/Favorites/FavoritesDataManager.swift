//
//  FavoritesDataManager.swift
//  Ecommerce
//
//  Created by Jonathan Miguel Onrubia Solis on 2/6/24.
//

import Combine

class FavoritesDataManager {
    
    private var favoritesAPI: FavoritesAPI
    
    init(favoritesAPI: FavoritesAPI) {
        self.favoritesAPI = favoritesAPI
    }
    
    func getFavoritesList() -> AnyPublisher<FavoritesModel, BaseError> {
        favoritesAPI.getFavoritesList()
    }
    func addFavorite(id: String) -> AnyPublisher<ApiError, BaseError> {
        favoritesAPI.addFavorite(id: id)
    }
    
    func deleteFavorite(id: String) -> AnyPublisher<ApiError, BaseError> {
        favoritesAPI.deleteFavorite(id: id)
    }
 
}
