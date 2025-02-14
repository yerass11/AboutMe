//
//  FavouritesView.swift
//  AboutMe
//
//  Created by Yerasyl on 13.02.2025.
//

import SwiftUI

struct HobbiesView: View {
    @Binding var showTab: Bool
    @State private var selectedHobby: Hobby?
    @State private var animateHobbies = false

    let hobbies = [
        Hobby(name: "Hormones", icon: "bandage.fill", description: "I study how hormones work and their effect on the body", shortsURL: "https://youtube.com/shorts/hi04x0Utk5k?si=gdQoB-0_v9soK3hE"),
        Hobby(name: "Football", icon: "soccerball", description: "I love both playing and watching football.", shortsURL: "https://youtube.com/shorts/pjiCETa2mns?si=C1TdZ_XNECOlNa6Y"),
        Hobby(name: "Movie", icon: "popcorn.fill", description: "I love to watch movies in my free time, one of my favourites is 'Iron Man(2008)'", shortsURL: "https://youtube.com/shorts/4WEPBEFj-UQ?si=LpLFEWDN5xfIp-0J"),
        Hobby(name: "Gaming", icon: "gamecontroller.fill", description: "In my free time, I enjoy playing CS2 with my friends", shortsURL: "https://youtube.com/shorts/nuC2BIW_600?si=LrQRo05u2EG7a_7h"),
        Hobby(name: "Reading", icon: "book.fill", description: "One of my favourites is Atomic Habits, which helped me improve my habits.", shortsURL: "https://youtube.com/shorts/ZOWeLxkO3v8?si=uKPcL7aUEpzATJxb"),
        Hobby(name: "Coding", icon: "keyboard.fill", description: "I love coding also solving algorithmic problems", shortsURL: "https://youtube.com/shorts/M1jycCH2kL4?si=P8C-ggaS3aMzwvco"),
        Hobby(name: "English language", icon: "globe", description: "Learning and practicing English language, watching TED X talks", shortsURL: "https://youtu.be/HAnw168huqA?si=Ox19TzhvY9_4d5I0"),
    ]

    var body: some View {
        VStack {
            Text("Hobbies")
                .font(.largeTitle.bold())
                .padding()
                .opacity(animateHobbies ? 1 : 0)
                .offset(y: animateHobbies ? 0 : -20)
                .animation(.easeOut(duration: 0.5), value: animateHobbies)

            ScrollView {
                LazyVGrid(columns: [GridItem(), GridItem()]) {
                    ForEach(hobbies, id: \..name) { hobby in
                        HobbyCard(hobby: hobby, selectedHobby: $selectedHobby, animateHobbies: animateHobbies)
                    }
                    .padding()
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
                            } else if newValue < oldValue + 10 {
                                showTab = true
                            }
                        })
            .onAppear {
                animateHobbies = true
            }
            .sheet(item: $selectedHobby) { hobby in
                HobbyDetailView(hobby: hobby)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
            }
        }
    }
}


#Preview {
    HobbiesView(showTab: .constant(true))
}
