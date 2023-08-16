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
    Topic(name: NSLocalizedString("iOS Development", comment: "iOS Development"), icon: "iphone"),
    Topic(name: NSLocalizedString("UI Design", comment: "UI Design"), icon: "eyedropper"),
    Topic(name: NSLocalizedString("Web Development", comment: "Web Development"), icon: "desktopcomputer")
]

let librarySettings = [
    Topic(name: NSLocalizedString("History", comment: "History"), icon: "clock.fill"),
    Topic(name: NSLocalizedString("Favorites", comment: "Favorites"), icon: "star.fill"),
    Topic(name: NSLocalizedString("Downloads", comment: "Downloads"), icon: "square.and.arrow.down.fill")
]
