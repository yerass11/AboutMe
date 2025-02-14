//
//  GoalsView.swift
//  AboutMe
//
//  Created by Yerasyl on 13.02.2025.
//
import SwiftUI

struct GoalsView: View {
    @State private var animateGoals = false

    let personalGoals = [
        "Optimize my daily routine for peak performance",
        "Have deep conversations with 100 interesting people",
        "Master staying calm under pressure"
    ]
    
    let futureAspirations = [
        "Build a revolutionary tech product",
        "Speak at a global tech conference",
        "Achieve financial independence by 30"
    ]
    
    var body: some View {
        VStack {
            Text("Goals")
                .font(.largeTitle.bold())
                .padding()
                .opacity(animateGoals ? 1 : 0)
                .offset(y: animateGoals ? 0 : -20)
                .animation(.easeOut(duration: 0.5), value: animateGoals)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    GoalsSection(title: "🎯 Personal Goals", goals: personalGoals, animateGoals: $animateGoals)
                    GoalsSection(title: "🚀 Future Aspirations", goals: futureAspirations, animateGoals: $animateGoals)
                }
                .padding()
            }
        }
        .onAppear {
            animateGoals = true
        }
    }
}



#Preview {
    GoalsView()
}
