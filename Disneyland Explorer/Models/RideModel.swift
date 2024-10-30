//
//  RideModel.swift
//  Disneyland Explorer
//
//  Created by Danielle Ellis on 10/26/24.
//

import SwiftUI
import Foundation

struct Ride: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let waitTime: String
}

