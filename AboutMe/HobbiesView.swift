//
//  FavouritesView.swift
//  AboutMe
//
//  Created by Yerasyl on 13.02.2025.
//

import SwiftUI

struct FavouritesView: View {
    @Binding var showTab: Bool
    @State private var selectedHobby: Hobby?
    let hobbies = [
        Hobby(name: "Reading", icon: "book.fill", description: "One of my favourites is Atomic Habits, which helped me improve my habits.", shortsURL: "https://youtube.com/shorts/ZOWeLxkO3v8?si=uKPcL7aUEpzATJxb"),
        Hobby(name: "Football", icon: "soccerball", description: "I love both playing and watching football.", shortsURL: "https://youtube.com/shorts/pjiCETa2mns?si=C1TdZ_XNECOlNa6Y"),
        Hobby(name: "Movie", icon: "popcorn.fill", description: "I love to watch movies in my free time, one of my favourites is 'Iron Man(2008)'", shortsURL: "https://youtube.com/shorts/4WEPBEFj-UQ?si=LpLFEWDN5xfIp-0J"),
        Hobby(name: "Gaming", icon: "gamecontroller.fill", description: "In my free time, I enjoy playing CS2 with my friends", shortsURL: "https://youtube.com/shorts/nuC2BIW_600?si=LrQRo05u2EG7a_7h"),
        Hobby(name: "Coding", icon: "keyboard.fill", description: "I love coding also solving algorithmic problems", shortsURL: "https://youtube.com/shorts/M1jycCH2kL4?si=P8C-ggaS3aMzwvco"),
        ]
    
    var body: some View {
        VStack {
            Text("Hobbies")
                .font(.largeTitle.bold())
                .padding()
            
            ScrollView {
                LazyVGrid(columns: [GridItem(), GridItem()]) {
                    ForEach(hobbies, id: \..self) { hobby in
                        VStack {
                            Image(systemName: hobby.icon)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                                .padding()
                            Text(hobby.name)
                                .font(.headline)
                        }
                        .frame(width: 150, height: 150)
                        .background(Color(.systemGray5))
                        .cornerRadius(12)
                        .padding(6)
                        .onTapGesture {
                            selectedHobby = hobby
                        }
                    }.padding()
                }
                Spacer(minLength: 100)
            }
            .padding()
            .safeAreaPadding(.horizontal, 10).scrollIndicators(.hidden)
            .onScrollGeometryChange(for: CGFloat.self, of: { geometry in
                geometry.contentOffset.y
            }, action: { oldValue, newValue in
                if newValue > oldValue {
                    withAnimation {
                        showTab = false
                    }
                } else if newValue < oldValue + 5 {
                    showTab = true
                }
            })
            .sheet(item: $selectedHobby) { hobby in
                HobbyDetailView(hobby: hobby)
            }
        }
    }
}

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
//

struct Hobby: Hashable, Identifiable {
    var id = UUID()
    let name: String
    let icon: String
    let description: String
    let shortsURL: String
}



