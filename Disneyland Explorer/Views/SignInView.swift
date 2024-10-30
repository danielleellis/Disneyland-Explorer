//
//  SignInView.swift
//  Disneyland Explorer
//
//  Created by Danielle Ellis on 10/26/24.
//

import SwiftUI

struct SignInView: View {
    @StateObject private var viewModel = SignInViewModel()
    @Binding var isLoggedIn: Bool // binding for the login state
    
    var body: some View {
        NavigationStack {
            ZStack {
                // gradient background
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 15) {
                    
                    Spacer()
                    
                    Image("castle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                        .padding(.bottom, 20)
                    
                    Text("Sign In")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding()
                        .fontDesign(.monospaced)
                    
                    // input fields
                    TextField("Email", text: $viewModel.credentials.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                    
                    SecureField("Password", text: $viewModel.credentials.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                    
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                            .padding()
                    }

                    Button("Sign In") {
                        viewModel.signIn()
                        if viewModel.navigateToHome {
                            isLoggedIn = true // update the login state from the ViewModel
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(Color.blue)
                    .foregroundColor(.white)
                    .padding()
                    .fontDesign(.monospaced)
                    .navigationDestination(isPresented: $viewModel.navigateToHome) {
                        HomePageView()
                    }
                    Spacer()
                    Spacer()
                }
                .padding(.top, 50)
            }
        }
    }
}

#Preview {
    SignInView(isLoggedIn: .constant(false))
}
