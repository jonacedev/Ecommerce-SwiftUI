//
//  FavoritesModel.swift
//  Ecommerce
//
//  Created by Jonathan Miguel Onrubia Solis on 2/6/24.
//

import Foundation

struct FavoritesModel: Decodable {
    let success: Bool?
    let favorites: [Product]?
}
