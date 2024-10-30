//
//  SearchViewModel.swift
//  Disneyland Explorer
//
//  Created by Danielle Ellis on 10/26/24.
//

import Foundation
import MapKit
import SwiftUI
import Combine

class SearchViewModel: ObservableObject {
    @Published var searchQuery: String = ""
    @Published var searchResults: [IdentifiableMapItem] = []
    
    private var isSearching = false

    init() {
        // searches whenever there is a change in the query
        $searchQuery
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .sink { [weak self] newValue in
                self?.searchPlaces()
            }
            .store(in: &cancellables)
    }
    
    private var cancellables = Set<AnyCancellable>()

    private func searchPlaces() {
        guard !searchQuery.isEmpty else {
            searchResults = []
            return
        }

        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchQuery

        let search = MKLocalSearch(request: request)
        search.start { [weak self] response, error in
            guard let response = response else {
                print("Error searching: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            self?.searchResults = response.mapItems.map { IdentifiableMapItem(mapItem: $0) }
        }
    }
}
