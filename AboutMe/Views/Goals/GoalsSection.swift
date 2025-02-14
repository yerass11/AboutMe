//
//  GoalsSection.swift
//  AboutMe
//
//  Created by Yerasyl on 14.02.2025.
//
import SwiftUI

struct GoalsSection: View {
    let title: String
    let goals: [String]
    @Binding var animateGoals: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text(title)
                .font(.title2.bold())
                .padding(.bottom, 5)
            
            Divider()
            
            ForEach(goals.indices, id: \.self) { index in
                HStack {
                    Circle()
                        .frame(width: 10, height: 10)
                        .foregroundColor(.blue)
                    Text(goals[index])
                        .font(.body)
                }
                .opacity(animateGoals ? 1 : 0)
                .offset(y: animateGoals ? 0 : 15)
                .animation(.easeOut(duration: 0.5).delay(Double(index) * 0.1), value: animateGoals)
            }
        }
        .padding()
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(12)
        .shadow(radius: 2)
    }
}
