import SwiftUI

struct RestaurantListView: View {
    
    @StateObject private var viewModel = RestaurantListViewModel()
    
    var body: some View {
        NavigationStack {
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading Restaurants...")
                    
                } else if let error = viewModel.errorMessage {
                    VStack(spacing: 12) {
                        Text(error)
                        Button("Retry") {
                            Task {
                                await viewModel.fetchRestaurants()
                            }
                        }
                    }
                    
                } else if viewModel.filterResults.isEmpty {
                    Text("No restaurants found")
                        .foregroundColor(.secondary)
                    
                } else {
                    List(viewModel.filterResults) { restaurant in
                        NavigationLink(value: restaurant) {
                            RestaurantRowView(restaurant: restaurant)
                        }
                    }
                }
            }
            .navigationTitle("Restaurants")
            .navigationDestination(for: Restaurant.self) { restaurant in
                MenuDetailView(restaurant: restaurant)
            }
            .task {
                await viewModel.fetchRestaurants()
            }
            .refreshable {
                await viewModel.fetchRestaurants()
            }
        }
    }
}

