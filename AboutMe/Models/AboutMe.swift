//
//  AboutMe.swift
//  AboutMe
//
//  Created by Yerasyl on 14.02.2025.
//

import SwiftUI

struct AboutMe: Hashable, Identifiable {
    var id = UUID()
    let name: String
    let photo: String
    let description: String
}
