//
//  LandingPageView.swift
//  Disneyland Explorer
//
//  Created by Danielle Ellis on 10/26/24.
//

import SwiftUI

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

#Preview {
    LandingView()
}

