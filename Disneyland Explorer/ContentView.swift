//
//  ContentView.swift
//  Disneyland Explorer
//
//  Created by Danielle Ellis on 9/21/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var isFirstLaunch: Bool = true
    @State private var isLoggedIn: Bool = false

    // Add state variables for sign-in
    @State private var userEmail: String = ""
    @State private var userPassword: String = ""

    var body: some View {
        NavigationView {
            Group {
                if isFirstLaunch {
                    LandingView()
                } else if isLoggedIn {
                    HomePageView()
                } else {
                    SignInView(userEmail: $userEmail, userPassword: $userPassword)
                }
            }
        }
    }
}

struct LandingView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                Spacer()
                Text("Disney Explorer")
                    .foregroundStyle(.white)
                    .font(.title)
                    .fontWeight(.semibold)
                    .fontDesign(.monospaced)
                Spacer()
                NavigationLink(destination: SignUpPageView()) {
                    Text("Get Started")
                        .foregroundColor(.blue)
                        .fontDesign(.monospaced)
                        
                }
                .buttonStyle(.borderedProminent)
                .tint(Color.white)
                .foregroundColor(.blue)
                .padding(.bottom, 30)
            }
            .gradientBackground()
        }
    }
}

struct SignUpPageView: View {
    @State private var userFirstName: String = ""
    @State private var userLastName: String = ""
    @State private var userEmail: String = ""
    @State private var userPassword: String = ""
    @State private var userDateOfBirth: Date = Date()
    @State private var navigateToHome: Bool = false
    @State private var errorMessage: String = ""

    var body: some View {
        NavigationStack {
            ZStack {
                // Gradient background
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

                    // Input fields
                    TextField("First Name", text: $userFirstName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)

                    TextField("Last Name", text: $userLastName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)

                    TextField("Email", text: $userEmail)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)

                    SecureField("Password", text: $userPassword)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)

                    DatePicker("Date of Birth", selection: $userDateOfBirth, in: ...Date(), displayedComponents: .date)
                        .padding(.horizontal)
                        .foregroundColor(.white)

                    if !errorMessage.isEmpty {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .padding()
                    }

                    Button("Sign Up") {
                        errorMessage = ""
                        validateInput()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(Color.blue)
                    .foregroundColor(.white)
                    .padding()
                    .navigationDestination(isPresented: $navigateToHome) {
                        HomePageView()
                    }

                    Spacer()
                }
                //.padding(.top, 100)
            }
        }
    }

    private func validateInput() {
        if userFirstName.isEmpty {
            errorMessage = "Please enter your first name"
        } else if userLastName.isEmpty {
            errorMessage = "Please enter your last name"
        } else if userEmail.isEmpty {
            errorMessage = "Please enter your email"
        } else if userPassword.isEmpty {
            errorMessage = "Please enter a password"
        } else {
            navigateToHome = true // okay to sign in
        }
    }
}




struct SignInView: View {
    @Binding var userEmail: String
    @Binding var userPassword: String

    var body: some View {
        NavigationStack {
            VStack {
                TextField("Email", text: $userEmail)
                    .font(.title3)
                    .padding()
                    .textFieldStyle(.roundedBorder)

                SecureField("Password", text: $userPassword) // Use SecureField for password
                    .font(.title3)
                    .padding()
                    .textFieldStyle(.roundedBorder)

                NavigationLink(destination: HomePageView()) {
                    Text("Sign In")
                        .buttonStyle(.borderedProminent)
                }
            }
            .padding()
            .navigationTitle("Sign In")
        }
    }
}

struct HomePageView: View {
    var body: some View {
        VStack {
            Text("Home Page View")
                .font(.largeTitle)
                .padding()
        }
    }
}

#Preview {
    ContentView()
}

