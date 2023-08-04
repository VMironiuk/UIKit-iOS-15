//
//  Notification.swift
//  Design+Code
//
//  Created by Volodymyr Myroniuk on 04.08.2023.
//

import UIKit

enum TBSection: CaseIterable {
    case main
}

struct NotificationModel: Hashable, Codable {
    var id: String?
    var title: String!
    var message: String!
    var subtitle: String!
    var image: String!
    var sentAt: Date!
}

let notifications = [
    NotificationModel(
        id: "0x1",
        title: "New Release",
        message: "A new release of the SwiftUI course has been released",
        subtitle: "SwiftUI",
        image: "Logo SwiftUI",
        sentAt: Date()
    ),
    NotificationModel(
        id: "0x2",
        title: "Content Update",
        message: "The React Hooks course has been updated",
        subtitle: "React Hooks",
        image: "React",
        sentAt: Date()
    ),
    NotificationModel(
        id: "0x3",
        title: "New Release",
        message: "A new release by Sai Kambampati has been pushed",
        subtitle: "UIKit for iOS 15",
        image: "SwiftUI",
        sentAt: Date()
    ),
    NotificationModel(
        id: "0x4",
        title: "Black Friday Deal",
        message: "Purchase your subscription for 20% off only today",
        subtitle: "Design+Code",
        image: "Design+Code",
        sentAt: Date()
    )
]
