//
//  Item.swift
//  Disneyland Explorer
//
//  Created by Danielle Ellis on 9/21/24.
//

import Foundation
import SwiftData
import MapKit

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}

// model for favorite items on the home page
struct FavoriteItem: Identifiable {
    let id = UUID()  // unique ID for identifiable
    let category: String
    let name: String
    let imageName: String
}

struct IdentifiableMapItem: Identifiable {
    let id = UUID() // unique ID for indentifiable
    let mapItem: MKMapItem
}
