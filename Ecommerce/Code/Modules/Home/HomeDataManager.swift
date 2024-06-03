//
//  HomeApiClient.swift
//  Ecommerce
//
//  Created by Jonathan Miguel Onrubia Solis on 2/6/24.
//

import Combine

class HomeDataManager {
    
    private var productsAPI: ProductsAPI
    private var favoritesAPI: FavoritesAPI
    private var usersAPI: UsersAPI
    
    init(productsAPI: ProductsAPI, favoritesAPI: FavoritesAPI, usersAPI: UsersAPI) {
        self.productsAPI = productsAPI
        self.favoritesAPI = favoritesAPI
        self.usersAPI = usersAPI
    }
    
    func getProductsList() -> AnyPublisher<ProductsModel, BaseError> {
        productsAPI.getProductsList()
    }
    
    func getFavoritesList() -> AnyPublisher<FavoritesModel, BaseError> {
        favoritesAPI.getFavoritesList()
    }
    
    func getDefaultUser() -> AnyPublisher<UserModel, BaseError> {
        usersAPI.getDefaultUser()
    }
    
    func addFavorite(id: String) -> AnyPublisher<ApiError, BaseError> {
        favoritesAPI.addFavorite(id: id)
    }
    
    func deleteFavorite(id: String) -> AnyPublisher<ApiError, BaseError> {
        favoritesAPI.deleteFavorite(id: id)
    }
 
    
}
