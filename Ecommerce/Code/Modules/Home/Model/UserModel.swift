//
//  UserModel.swift
//  Ecommerce
//
//  Created by Jonathan Miguel Onrubia Solis on 2/6/24.
//

import Foundation

struct UserModel: Decodable {
    let success: Bool?
    let data: User?
}

struct User: Decodable {
    let id: String?
    let username: String?
    let profileImage: String?
    
}
