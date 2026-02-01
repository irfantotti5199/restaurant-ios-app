//
//  Restaurant.swift
//  Restaurant
//
//  Created by Irfan on 01/02/26.
//

import Foundation

import Foundation

struct Restaurant: Codable, Identifiable, Hashable {
    let id: String
    let name: String
    let cuisine: String
    let rating: Double
    let deliveryTime: String
    let imageURL: String
    let isVeg: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case cuisine
        case rating
        case deliveryTime
        case imageURL = "imageUrl"
        case isVeg
    }
}

struct MenuResponse: Codable {
    let restaurantId: String
    let menu: [MenuCategory]
}

struct MenuCategory: Identifiable, Codable {
    let id = UUID()
    let category: String
    let items: [MenuItem]
}

struct MenuItem: Codable, Identifiable {
    let id: String
    let name: String
    let price: Int
    let description: String
    let isVeg: Bool
}


