//
//  Topic.swift
//  Design+Code
//
//  Created by Volodymyr Myroniuk on 20.07.2023.
//

import UIKit

class Topic {
    
    var topicName: String
    var topicSymbol: String

    init(name: String!, icon: String!) {
        self.topicName = name
        self.topicSymbol = icon
    }
    
}

let topics = [
    Topic(name: "iOS Development", icon: "iphone"),
    Topic(name: "UI Design", icon: "eyedropper"),
    Topic(name: "Web Development", icon: "desktopcomputer")
]

let librarySettings = [
    Topic(name: "History", icon: "clock.fill"),
    Topic(name: "Favorites", icon: "star.fill"),
    Topic(name: "Downloads", icon: "square.and.arrow.down.fill")
]
