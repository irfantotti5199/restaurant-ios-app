import SwiftUI

struct MenuDetailView: View {
    
    let restaurant: Restaurant
    @StateObject private var viewModel = MenuViewModel()
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()
                
            } else if let error = viewModel.errorMessage {
                Text(error)
                
            } else {
                List {
                    ForEach(viewModel.menuCatagories) { category in
                        Section(header: Text(category.category)) {
                            ForEach(category.items) { item in
                                MenuItemRow(
                                    item: item,
                                    addAction: viewModel.addToCart
                                )
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle(restaurant.name)
        .toolbar {
            Text("Cart: \(viewModel.cartCount)")
        }
        .task {
            await viewModel.fetchMenu(for: restaurant.id)
        }
    }
}

