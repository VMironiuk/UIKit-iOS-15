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
        background: nil
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
        background: nil
    )
]
