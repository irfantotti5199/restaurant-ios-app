//
//  MenuItemRow.swift
//  Restaurant
//
//  Created by Irfan on 01/02/26.
//

import SwiftUI

struct MenuItemRow: View {
    let item: MenuItem
    let addAction: ()->Void
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(item.name).font(.headline)
                Spacer()
                Text("₹\(item.price)")
                
            }
            
            Text(item.description).font(.caption)
            
            HStack {
                Text(item.isVeg ? "Veg" : "Non-Veg")
                Spacer()
                Button("Add") {
                    addAction()
                }
            }
        }
    }
}

