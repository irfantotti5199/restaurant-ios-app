//
//  RestaurantListViewModel.swift
//  Restaurant
//
//  Created by Irfan on 01/02/26.
//

import Foundation
import Combine

@MainActor
final class RestaurantListViewModel: ObservableObject {
    
    @Published var restaurants: [Restaurant] = []
    @Published var searchString: String = ""
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    
    var filterResults: [Restaurant] {
        if searchString.isEmpty {
            return restaurants
        }
        return restaurants.filter {
            $0.name.localizedCaseInsensitiveContains(searchString) || $0.cuisine.localizedCaseInsensitiveContains(searchString)
        }
    }
    
    func fetchRestaurants() async {
        isLoading = true
        errorMessage = nil
        
        do {
            restaurants = try await APIService.shared.fetchRestaurants()
        } catch {
            errorMessage = "Failed to load restaurants"
        }
        
        isLoading = false
    }
}

