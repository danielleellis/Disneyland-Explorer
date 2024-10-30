//
//  RideViewModel.swift
//  Disneyland Explorer
//
//  Created by Danielle Ellis on 10/26/24.
//

import Foundation
import Combine

class RideViewModel: ObservableObject {
    @Published var rides: [Ride] = []
    @Published var searchQuery: String = ""
    @Published var filteredRides: [Ride] = []
    
    // hardcoded for now - will implement API for Phase II
    init() {
        self.rides = [
            Ride(name: "Space Mountain", imageName: "spacemountain", waitTime: "45 mins"),
            Ride(name: "Pirates of the Caribbean", imageName: "pirates", waitTime: "30 mins"),
            Ride(name: "Haunted Mansion", imageName: "hauntedmansion", waitTime: "20 mins"),
            Ride(name: "Indiana Jones Adventure", imageName: "indianajones", waitTime: "50 mins"),
            Ride(name: "Matterhorn Bobsleds", imageName: "matterhorn", waitTime: "40 mins"),
            Ride(name: "Thunder Mountain Railroad", imageName: "thundermountain", waitTime: "35 mins")
        ]
        
        // filter rides when the search query changes - calls filterRides()
        $searchQuery
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] query in
                self?.filterRides()
            }
            .store(in: &cancellables)
    }
    
    private var cancellables = Set<AnyCancellable>()
    
    // filter function based on search query
    private func filterRides() {
        if searchQuery.isEmpty {
            filteredRides = rides
        } else {
            filteredRides = rides.filter { $0.name.lowercased().contains(searchQuery.lowercased()) }
        }
    }
}
