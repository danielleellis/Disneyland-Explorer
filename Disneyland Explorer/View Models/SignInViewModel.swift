//
//  SignInViewModel.swift
//  Disneyland Explorer
//
//  Created by Danielle Ellis on 10/26/24.
//

import Foundation
import SwiftUI

class SignInViewModel: ObservableObject {
    @Published var credentials = UserCredentials(email: "", password: "")
    @Published var navigateToHome: Bool = false
    @Published var errorMessage: String = ""

    func signIn() {
        
        if credentials.email.isEmpty || credentials.password.isEmpty {
            errorMessage = "Please enter both email and password"
        } else {
            // sign in
            navigateToHome = true
        }
    }
}
