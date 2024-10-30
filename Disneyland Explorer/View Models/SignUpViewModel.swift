//
//  SignUpViewModel.swift
//  Disneyland Explorer
//
//  Created by Danielle Ellis on 10/26/24.
//


import Foundation
import SwiftUI

class SignUpViewModel: ObservableObject {
    @Published var user = User(firstName: "", lastName: "", email: "", password: "", dateOfBirth: Date())
    @Published var errorMessage: String = ""
    @Published var navigateToHome: Bool = false
    
    func validateInput() {
        errorMessage = ""
        
        if user.firstName.isEmpty {
            errorMessage = "Please enter your first name"
        } else if user.lastName.isEmpty {
            errorMessage = "Please enter your last name"
        } else if user.email.isEmpty {
            errorMessage = "Please enter your email"
        } else if user.password.isEmpty {
            errorMessage = "Please enter a password"
        } else {
            navigateToHome = true // navigate to HomePageView if inputs are valid
        }
    }
}
