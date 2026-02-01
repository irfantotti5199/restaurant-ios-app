//
//  APIService.swift
//  Restaurant
//
//  Created by Irfan on 01/02/26.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case invalidResponse
    case decordingError
}
enum MockAPIError: Error {
    case decordingFailed
}

final class APIService {
    static let shared = APIService()
    private init() {
        
    }
    
    func fetchRestaurants() async throws -> [Restaurant] {
//        guard let url = URL(string: "https://mock-api.swiggy.com/restaurants?location=hyderabad") else {
//            throw APIError.invalidURL
//        }
//        
//        let (data, response) = try await URLSession.shared.data(from: url)
//        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
//            throw APIError.invalidResponse
//        }
        
        try await simulateDelay()
        let json = """
            [
                      {
                        "id": "rest1",
                        "name": "Biryani House",
                        "cuisine": "Indian, Biryani",
                        "rating": 4.5,
                        "deliveryTime": "30-40 mins",
                        "imageUrl": "",
                        "isVeg": false
                      },
                      {
                        "id": "rest2",
                        "name": "Pizza Corner",
                        "cuisine": "Italian, Pizza",
                        "rating": 4.2,
                        "deliveryTime": "25-35 mins",
                        "imageUrl": "",
                        "isVeg": true
                      }
                    ]
            """
        
        guard let data = json.data(using: .utf8), let restaurants = try? JSONDecoder().decode([Restaurant].self, from: data) else {
            throw MockAPIError.decordingFailed
        }
        return restaurants
    }
    
    private func simulateDelay() async throws {
        try await Task.sleep(nanoseconds: 600_000_000)
    }
    
    func fetchMenu(for restaurantId: String) async throws -> MenuResponse {
//        guard let url = URL(string: "https://mock-api.swiggy.com/menu?restaurantId=\(restaurantId)") else {
//            throw APIError.invalidURL
//            
//        }
//        
//        let (data, response) = try await URLSession.shared.data(from: url)
//        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
//            throw APIError.invalidResponse
//        }
//        return try JSONDecoder().decode(MenuResponse.self, from: data)
        
        try await simulateDelay()
        let json = """
            {
                      "restaurantId": "\(restaurantId)",
                      "menu": [
                        {
                          "category": "Recommended",
                          "items": [
                            {
                              "id": "item1",
                              "name": "Chicken Biryani",
                              "price": 250,
                              "description": "Spicy chicken biryani with basmati rice",
                              "isVeg": false
                            },
                            {
                              "id": "item2",
                              "name": "Veg Pizza",
                              "price": 300,
                              "description": "Loaded with veggies and cheese",
                              "isVeg": true
                            }
                          ]
                        }
                      ]
                    }
            """
        
        guard let data = json.data(using: .utf8), let menu = try? JSONDecoder().decode(MenuResponse.self, from: data) else {
            throw MockAPIError.decordingFailed
        }
        return menu
                
    }
}
