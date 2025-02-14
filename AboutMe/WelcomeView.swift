//
//  WelcomeView.swift
//  AboutMe
//
//  Created by Yerasyl on 13.02.2025.
//

import SwiftUI

struct WelcomeView: View {
    @State private var isHomePresented = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.gray
            GeometryReader { geo in
                Image("BG").resizable().scaledToFill()
                    .frame(width: geo.size.width, height: geo.size.height / 1.7)
            }
            
            VStack(spacing: 50) {
                Text("Hey! Let's get to know each other more")
                    .font(.system(size: 54).bold())
                    .foregroundColor(.black)
                
                Button {
                    isHomePresented = true
                } label: {
                    Text("Get Started")
                        .font(.title.bold())
                        .frame(height: 65)
                        .frame(maxWidth: .infinity)
                        .background(.indigo, in: .capsule)
                        .overlay(alignment: .trailing) {
                            Image(systemName: "arrow.forward")
                                .font(.title2.bold())
                                .foregroundStyle(.black)
                                .padding()
                                .background(.yellow, in: .circle)
                                .padding(.trailing, 3)
                        }
                }
                .tint(.white)
                .padding(.horizontal)
                .fullScreenCover(isPresented: $isHomePresented) {
                    ContentView()
                }
            }
            .padding()
            .padding(.bottom)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    WelcomeView()
}
