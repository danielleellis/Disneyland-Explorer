//
//  MapViewModel.swift
//  Disneyland Explorer
//
//  Created by Danielle Ellis on 10/26/24.
//

import Foundation
import MapKit
import Combine

class MapViewModel: ObservableObject {
    @Published var searchQuery: String = ""
    @Published var annotations: [IdentifiableMapItem] = []
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 33.8121, longitude: -117.9190),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
    private var cancellables = Set<AnyCancellable>()

    init() {
        setupSearchObserver()
    }

    // observes for changes in search query
    private func setupSearchObserver() {
        $searchQuery
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .sink { [weak self] query in
                self?.searchPlaces(query: query)
            }
            .store(in: &cancellables)
    }

    // searches and updates annotations
    func searchPlaces(query: String) {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query
        request.region = region
        
        let search = MKLocalSearch(request: request)
        search.start { [weak self] response, error in
            guard let response = response else {
                print("Error searching: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            // update annotations based on the results
            DispatchQueue.main.async {
                self?.annotations = response.mapItems.map { IdentifiableMapItem(mapItem: $0) }
            }
        }
    }
}
