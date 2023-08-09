//
//  Notification.swift
//  Design+Code
//
//  Created by Volodymyr Myroniuk on 04.08.2023.
//

import UIKit
import FirebaseFirestore
import FirebaseFirestoreSwift

enum TBSection: CaseIterable {
    case main
}

struct NotificationModel: Hashable, Codable {
    @DocumentID var id: String?
    var title: String!
    var message: String!
    var subtitle: String!
    var image: String!
    var sentAt: Timestamp!
}
