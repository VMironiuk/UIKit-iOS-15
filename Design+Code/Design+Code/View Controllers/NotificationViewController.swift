//
//  NotificationViewController.swift
//  Design+Code
//
//  Created by Volodymyr Myroniuk on 03.08.2023.
//

import UIKit
import Combine

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
        
        loadData()
    }
    
    private func loadData() {
        currentSnapshot = NSDiffableDataSourceSnapshot<TBSection, NotificationModel>()
        currentSnapshot.appendSections([.main])
        self.currentSnapshot.appendItems(notifications, toSection: .main)
        self.dataSource.apply(currentSnapshot, animatingDifferences: true)
    }
}

extension NotificationViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
