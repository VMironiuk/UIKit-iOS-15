//
//  Course.swift
//  Design+Code
//
//  Created by Volodymyr Myroniuk on 06.07.2023.
//

import UIKit

struct Course {
    let title: String
    let subtitle: String
    let description: String
    let icon: UIImage?
    let banner: UIImage?
    let authors: [String]?
    let colors: [CGColor]?
    let background: UIImage?
    let sections: [Section]
}

let handbooks = [
    Course(
        title: "SwiftUI Handbook",
        subtitle: "80 sections - 9 hours",
        description: "Build an iOS app for iOS 15 with custom layouts, animations, and more",
        icon: UIImage(named: "Logo SwiftUI"),
        banner: UIImage(named: "Illustration 2"),
        authors: ["Meng To"],
        colors: [
            UIColor(red: 0.387, green: 0.041, blue: 0.55, alpha: 1.0).cgColor,
            UIColor(red: 0.251, green: 0.555, blue: 0.835, alpha: 1.0).cgColor
        ],
        background: nil,
        sections: sections
    ),
    Course(
        title: "React Hooks Handbook",
        subtitle: "30 sections - 3 hours",
        description: "A comprehensive series of tutorials on React Hooks and more!",
        icon: UIImage(named: "Logo React"),
        banner: UIImage(named: "Illustration 4"),
        authors: ["Meng To, Stephanie Diep"],
        colors: [
            UIColor(red: 0.51, green: 0.255, blue: 0.737, alpha: 1.0).cgColor,
            UIColor(red: 0.883, green: 0.283, blue: 0.523, alpha: 1.0).cgColor,
            UIColor(red: 0.984, green: 0.647, blue: 0.545, alpha: 1.0).cgColor
        ],
        background: nil,
        sections: sections
    )
]

let courses = [
    Course(
        title: "SwiftUI Concurrency",
        subtitle: "NEW VIDEO",
        description: "Build an iOS app for iOS 15 with custom layouts, animations and more!",
        icon: UIImage(named: "Logo SwiftUI"),
        banner: UIImage(named: "Illustration 4"),
        authors: ["Meng To"],
        colors: nil,
        background: UIImage(named: "Background 3"),
        sections: sections
    ),
    Course(
        title: "Flutter for Designers",
        subtitle: "20 sections - 3 hours",
        description: "Build a Flutter app for iOS and Android with custom layouts, animations and more!",
        icon: UIImage(named: "Logo Flutter"),
        banner: UIImage(named: "Illustration 1"),
        authors: ["Sai Kambampati"],
        colors: nil,
        background: UIImage(named: "Background 4"),
        sections: sections
    ),
    Course(
        title: "React Hooks Advanced",
        subtitle: "20 sections - 3 hours",
        description: "Build a React app with custom layouts, animations and more!",
        icon: UIImage(named: "Logo React"),
        banner: UIImage(named: "Illustration 2"),
        authors: ["Meng To"],
        colors: nil,
        background: UIImage(named: "Background 5"),
        sections: sections
    )
]
