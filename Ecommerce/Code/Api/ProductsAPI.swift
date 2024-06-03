//
//  ProductsAPI.swift
//  Ecommerce
//
//  Created by Jonathan Miguel Onrubia Solis on 2/6/24.
//

import Combine

class ProductsAPI: BaseApiClient {
    
    func getProductsList() -> AnyPublisher<ProductsModel, BaseError> {
        let path = "/products/getList"
        return requestPublisher(path: path,
                                method: .get)
    }
}
