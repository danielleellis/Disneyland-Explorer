//
//  SearchView.swift
//  Disneyland Explorer
//
//  Created by Danielle Ellis on 10/25/24.
//

import SwiftUI
import MapKit

// SearchView - view that allows users to search for places within
// their maps location, and displays the results

struct SearchView: View {
    @ObservedObject var viewModel: SearchViewModel

    var body: some View {
        VStack {
            TextField("Search...", text: $viewModel.searchQuery)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            List(viewModel.searchResults) { item in
                Text(item.mapItem.name ?? "Unknown")
            }
        }
    }
}
