//
//  FavoritesPageViewModel.swift
//  Disneyland Explorer
//
//  Created by Danielle Ellis on 10/26/24.
//

import SwiftUI
import Combine

class HomePageViewModel: ObservableObject {
    @Published var favorites: [FavoriteItem] = []
    @Published var reloadHome: Bool = false
    
    init() {
        loadFavorites()
    }
    
    // hardcoded for now - will implement true functionality in Phase II
    private func loadFavorites() {
        favorites = [
            FavoriteItem(category: "Ride", name: "Space Mountain", imageName: "spacemountain"),
            FavoriteItem(category: "Shop", name: "Emporium", imageName: "emporium"),
            FavoriteItem(category: "Food", name: "Dole Whip", imageName: "dolewhip"),
            FavoriteItem(category: "Show", name: "Fantasmic", imageName: "fantasmic"),
            FavoriteItem(category: "Ride", name: "Matterhorn Bobsleds", imageName: "matterhorn"),
            FavoriteItem(category: "Ride", name: "Indiana Jones", imageName: "indianajones")
        ]
    }
    
    // Reloads the home view by toggling the reloadHome property
    func reloadHomeView() {
        reloadHome.toggle()
    }
}
