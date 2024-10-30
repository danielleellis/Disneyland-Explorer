//
//  ContentView.swift
//  Disneyland Explorer
//
//  Created by Danielle Ellis on 9/21/24.
//

import SwiftUI
import SwiftData
import MapKit

struct ContentView: View {
    @State private var isFirstLaunch: Bool = true
    @State private var isLoggedIn: Bool = false
    
    var body: some View {
        NavigationView {
            Group {
                if isFirstLaunch {
                    LandingView()
                } else if isLoggedIn {
                    HomePageView()
                } else {
                    SignInView(isLoggedIn: $isLoggedIn) // pass binding for login
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
