//
//  place.swift
//  Disneyland Explorer
//
//  Created by Danielle Ellis on 10/25/24.
//

import Foundation
import UIKit
import CoreLocation

struct Place: Identifiable {
    var id = UUID()
    var name: String
    var description: String
    var image: UIImage?
    var coordinate: CLLocationCoordinate2D
}

