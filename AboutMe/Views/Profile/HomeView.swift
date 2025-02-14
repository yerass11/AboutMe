//
//  HomeView.swift
//  AboutMe
//
//  Created by Yerasyl on 13.02.2025.
//
import SwiftUI

struct HomeView: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var showTab: Bool
    
    @State private var animateProfile = false
    @State private var animateText = false
    @State private var animateGitHub = false
    
    var body: some View {
        VStack {
            headerSection
            contentSection
        }
        .padding()
        .onAppear(perform: startAnimations)
    }
}

private extension HomeView {
    var headerSection: some View {
        Text("Profile")
            .font(.largeTitle.bold())
            .padding()
            .opacity(animateText ? 1 : 0)
            .offset(y: animateText ? 0 : -20)
            .animation(.easeOut(duration: 0.5), value: animateText)
    }
    
    var contentSection: some View {
        ScrollView {
            LazyVStack {
                profileImage
                userInfo
                biography
            }
            .padding(.vertical)
            .background(Color(.systemGray6))
            .cornerRadius(12)
            
            githubImage
            Spacer(minLength: 100)
        }
        .padding()
        .safeAreaPadding(.horizontal, 10)
        .scrollIndicators(.hidden)
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
    }
    
    var profileImage: some View {
        Image("profile_picture")
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.gray, lineWidth: 2))
            .padding()
            .scaleEffect(animateProfile ? 1 : 0.8)
            .opacity(animateProfile ? 1 : 0)
            .animation(.spring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.3), value: animateProfile)
    }
    
    var userInfo: some View {
        VStack(spacing: 5) {
            Text("Saiman Yerassyl")
                .font(.title2.bold())
                .opacity(animateText ? 1 : 0)
                .offset(y: animateText ? 0 : 15)
                .animation(.easeOut(duration: 0.5).delay(0.2), value: animateText)
            
            Text("Age: 19 | Aktobe, Kazakhstan")
                .font(.subheadline)
                .foregroundColor(.gray)
                .opacity(animateText ? 1 : 0)
                .offset(y: animateText ? 0 : 15)
                .animation(.easeOut(duration: 0.5).delay(0.4), value: animateText)
            
            Text("iOS Developer")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()
                .opacity(animateText ? 1 : 0)
                .offset(y: animateText ? 0 : 15)
                .animation(.easeOut(duration: 0.5).delay(0.6), value: animateText)
        }
    }
    
    var biography: some View {
        Text("Since childhood, I have been passionate about mathematics and physics, which led me to participate in various Olympiads and win prizes. I studied in 6th gymnasium. My dedication to academics helped me graduate from high school with a gold medal.")
            .font(.body)
            .multilineTextAlignment(.center)
            .padding()
            .opacity(animateText ? 1 : 0)
            .offset(y: animateText ? 0 : 15)
            .animation(.easeOut(duration: 0.5).delay(0.8), value: animateText)
    }
    
    var githubImage: some View {
        Image(colorScheme == .light ? "github_light" : "github_dark")
            .resizable()
            .scaledToFill()
            .padding(.top, 32)
            .cornerRadius(26)
            .scaleEffect(animateGitHub ? 1 : 0.8)
            .opacity(animateGitHub ? 1 : 0)
            .animation(.spring(response: 0.6, dampingFraction: 0.6).delay(1), value: animateGitHub)
    }
}

private extension HomeView {
    func startAnimations() {
        animateProfile = true
        animateText = true
        animateGitHub = true
    }
}

#Preview {
    HomeView(showTab: .constant(true))
}
