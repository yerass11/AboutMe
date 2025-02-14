//
//  ContentView.swift
//  AboutMe
//
//  Created by Yerasyl on 13.02.2025.
//

import SwiftUI

struct ContentView: View {
    @State var showTab: Bool = true
    @State var selectedTab: TabIcon = .home
    
    var body: some View {
        VStack {
            switch selectedTab {
            case .home:
                HomeView(showTab: $showTab)
            case .favourites:
                HobbiesView(showTab: $showTab)
            case .goals:
                GoalsView()
            }
        }
        .overlay(alignment: .bottom) {
            if showTab {
                CustomTabBar(selectedTab: $selectedTab)
                    .transition(.offset(y: 300))
            }
        }
    }
}



#Preview {
    ContentView()
}
