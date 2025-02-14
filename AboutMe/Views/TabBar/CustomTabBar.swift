//
//  CustomTabBar.swift
//  AboutMe
//
//  Created by Yerasyl on 13.02.2025.
//

import SwiftUI



struct CustomTabBar: View {
    let tabItems = [
        TabBar(iconName: "house", tab: .home),
        TabBar(iconName: "heart", tab: .favourites),
        TabBar(iconName: "trophy", tab: .goals),
    ]
    @Binding var selectedTab: TabIcon
    @Namespace var animationNamespace
    
    var body: some View {
        HStack {
            ForEach(tabItems) { item in
                Spacer()
                Image(systemName: item.iconName)
                    .font(.title2)
                    .symbolVariant(selectedTab == item.tab ? .fill : .none)
                    .contentTransition(.symbolEffect)
                    .foregroundStyle(selectedTab == item.tab ? Color.primary : .gray)
                    .onTapGesture {
                        withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                            selectedTab = item.tab
                        }
                    }
                    .background {
                        Group {
                            if selectedTab == item.tab {
                                Circle()
                                    .frame(width: 70)
                                    .foregroundStyle(Color(.systemGray4))
                                    .matchedGeometryEffect(id: "circle", in: animationNamespace)
                            }
                        }
                    }
                Spacer()
            }
        }
        .frame(height: 90)
        .background(Color(.systemGray6), in: .capsule)
        .padding(.horizontal, 10)
    }
}

//#Preview {
//    CustomTabBar()
//}
