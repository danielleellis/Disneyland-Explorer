//
//  User.swift
//  Disneyland Explorer
//
//  Created by Danielle Ellis on 10/26/24.
//

import Foundation

struct User {
    var firstName: String
    var lastName: String
    var email: String
    var password: String
    var dateOfBirth: Date
}

struct UserCredentials {
    var email: String
    var password: String
}
