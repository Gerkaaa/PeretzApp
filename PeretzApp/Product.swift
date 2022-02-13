//
//  Product.swift
//  PeretzApp
//
//  Created by Герекмаз Газимагомедова on 13.02.2022.
//

import Foundation

// MARK: - Product
struct Product: Decodable {
    let id: Int
    let date, name, description: String
    let new: Bool
    let price: Int
    let image_app, image: String
    let sort: Int
}
