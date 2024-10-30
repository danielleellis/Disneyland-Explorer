//
//  Modifiers.swift
//  Disneyland Explorer
//
//  Created by Danielle Ellis on 9/22/24.
//

import SwiftUI

struct GradientBackground: ViewModifier {
    var colors: [Color] = [Color.blue, Color.purple] 
    
    func body(content: Content) -> some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: colors),
                           startPoint: .top,
                           endPoint: .bottom)
                .ignoresSafeArea() // cover entire area with gradient background
            content
        }
    }
}

extension View {
    func gradientBackground(colors: [Color] = [Color.blue, Color.purple]) -> some View {
        self.modifier(GradientBackground(colors: colors))
    }
}

