//
//  Hobby.swift
//  AboutMe
//
//  Created by Yerasyl on 14.02.2025.
//
import SwiftUI

struct Hobby: Hashable, Identifiable {
    var id = UUID()
    let name: String
    let icon: String
    let description: String
    let shortsURL: String
}
