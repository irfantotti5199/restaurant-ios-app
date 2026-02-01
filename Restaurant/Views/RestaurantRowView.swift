//
//  RestaurantRowView.swift
//  Restaurant
//
//  Created by Irfan on 01/02/26.
//

import SwiftUI

struct RestaurantRowView: View {
    let restaurant: Restaurant
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: restaurant.imageURL)) { image in
                image.resizable()
            } placeholder: {
                Color.gray
            }
            .frame(width: 60,height: 60)
            .cornerRadius(8)
            
            VStack(alignment: .leading) {
                Text(restaurant.name).font(.headline)
                Text(restaurant.cuisine).font(.subheadline)
                HStack {
                    HStack(spacing: 4) {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text(String(format: "%.1f", restaurant.rating))
                            .font(.caption)
                    }
                }
                .font(.caption)
                
            }
        }
    }
}

