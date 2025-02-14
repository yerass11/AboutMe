//
//  HobbyDetailView.swift
//  AboutMe
//
//  Created by Yerasyl on 14.02.2025.
//

import SwiftUI

struct HobbyDetailView: View {
    let hobby: Hobby
    
    var body: some View {
        VStack(spacing: 20) {
            YouTubeShortsWebView(shortsURL: hobby.shortsURL)
                .frame(height: 500)
                .cornerRadius(10)
                .shadow(radius: 5)
            Text(hobby.name)
                .font(.title.bold())
            Text(hobby.description)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()
            Spacer()
        }
        .padding()
    }
}

