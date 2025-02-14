//
//  HobbyCard.swift
//  AboutMe
//
//  Created by Yerasyl on 14.02.2025.
//

import SwiftUI

struct HobbyCard: View {
    let hobby: Hobby
    @Binding var selectedHobby: Hobby?
    let animateHobbies: Bool
    
    var body: some View {
        VStack {
            Image(systemName: hobby.icon)
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
                .padding()
                .scaleEffect(selectedHobby == hobby ? 1.2 : 1)
                .animation(.spring(response: 0.4, dampingFraction: 0.6), value: selectedHobby)
            
            Text(hobby.name)
                .font(.headline)
        }
        .frame(width: 150, height: 150)
        .background(Color(.systemGray5))
        .cornerRadius(12)
        .padding(6)
        .opacity(animateHobbies ? 1 : 0)
        .offset(y: animateHobbies ? 0 : 15)
        .animation(.easeOut(duration: 0.5), value: animateHobbies)
        .onTapGesture {
            withAnimation {
                selectedHobby = hobby
            }
        }
    }
}

