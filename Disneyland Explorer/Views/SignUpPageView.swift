//
//  SignUpView.swift
//  Disneyland Explorer
//
//  Created by Danielle Ellis on 10/26/24.
//

import SwiftUI

struct SignUpPageView: View {
    @StateObject private var viewModel = SignUpViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                // gradient background
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 15) {
                    
                    Image("castle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                    
                    Text("Sign Up")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding()
                    
                    // input fields
                    TextField("First Name", text: $viewModel.user.firstName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                    
                    TextField("Last Name", text: $viewModel.user.lastName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                    
                    TextField("Email", text: $viewModel.user.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                    
                    SecureField("Password", text: $viewModel.user.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                    
                    DatePicker("Date of Birth", selection: $viewModel.user.dateOfBirth, in: ...Date(), displayedComponents: .date)
                        .padding(.horizontal)
                        .foregroundColor(.white)
                    
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                            .padding()
                    }
                    
                    Button("Sign Up") {
                        viewModel.validateInput()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(Color.blue)
                    .foregroundColor(.white)
                    .padding()
                    .navigationDestination(isPresented: $viewModel.navigateToHome) {
                        HomePageView()
                    }
                    
                    Spacer()
                }
                //.padding(.top, 100)
            }
        }
    }
}

#Preview {
    SignUpPageView()
}
