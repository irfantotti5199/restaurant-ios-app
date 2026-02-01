//
//  MenuViewModel.swift
//  Restaurant
//
//  Created by Irfan on 01/02/26.
//

import Foundation
import Combine

@MainActor
final class MenuViewModel: ObservableObject {
    @Published var menuCatagories : [MenuCategory] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var cartCount = 0
    
    func fetchMenu(for restaurantId: String) async {
        isLoading = true
        errorMessage = nil
        
        do {
            let menuResponse = try await APIService.shared.fetchMenu(for: restaurantId)
            menuCatagories = menuResponse.menu
        } catch {
            errorMessage =  "Failed to load menu"
        }
        
        isLoading = false
        
    }
    
    func addToCart() {
        cartCount += 1
    }
}
