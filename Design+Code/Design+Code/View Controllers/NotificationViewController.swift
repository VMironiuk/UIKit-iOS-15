//
//  NotificationViewController.swift
//  Design+Code
//
//  Created by Volodymyr Myroniuk on 03.08.2023.
//

import UIKit
import Combine
import FirebaseFirestore

class NotificationViewController: UIViewController {
    @IBOutlet var cardView: CustomView!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var tableViewHeight: NSLayoutConstraint!

    private var tokens: Set<AnyCancellable> = []

    var dataSource: UITableViewDiffableDataSource<TBSection, NotificationModel>! = nil
    var currentSnapshot: NSDiffableDataSourceSnapshot<TBSection, NotificationModel>! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView
            .publisher(for: \.contentSize)
            .sink { contentSize in
                self.tableViewHeight.constant = contentSize.height + 10
            }
            .store(in: &tokens)

        tableView.delegate = self
        
        // Configure Data Source
        self.dataSource = UITableViewDiffableDataSource<TBSection, NotificationModel>(tableView: tableView) {
            (tableView: UITableView, indexPath: IndexPath, item: NotificationModel) -> NotificationTableViewCell in

            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "NotificationTableViewCell",
                for: indexPath) as? NotificationTableViewCell else {
                fatalError("Can't create a new cell")
            }

            cell.titleLabel.text = item.title
            cell.messageLabel.text = item.message
            cell.subtitleLabel.text = item.subtitle
            cell.notificationImageView.image = UIImage(named: item.image)

            return cell
        }
        self.dataSource.defaultRowAnimation = .fade
        
        Task {
            do {
                try await loadData()
            } catch let error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    private func loadData() async throws {
        currentSnapshot = NSDiffableDataSourceSnapshot<TBSection, NotificationModel>()
        currentSnapshot.appendSections([.main])
        
        let docs = try await Firestore.firestore().collection("notifications")
            .order(by: "sentAt", descending: true)
            .getDocuments()
        var notifications = [NotificationModel]()
        
        for snapshot in docs.documents {
            if let data = try? snapshot.data(as: NotificationModel.self) {
                notifications.append(data)
            }
        }
        
        self.currentSnapshot.appendItems(notifications, toSection: .main)
        await self.dataSource.apply(currentSnapshot, animatingDifferences: true)
        
        DispatchQueue.main.async {
            self.cardView.alpha = 1
        }
    }
}

extension NotificationViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
