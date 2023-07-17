//
//  CoursesViewController.swift
//  Design+Code
//
//  Created by Volodymyr Myroniuk on 12.07.2023.
//

import UIKit
import Combine

class CoursesViewController: UIViewController {
    
    @IBOutlet var bannerImage: UIImageView!
    @IBOutlet var backgroundImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var sectionsTableView: UITableView!
    @IBOutlet var tableViewHeight: NSLayoutConstraint!
    @IBOutlet var iconImageView: CustomImageView!
    @IBOutlet var menuButton: UIButton!
    
    private var tokens: Set<AnyCancellable> = []
    
    var course: Course?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        sectionsTableView.delegate = self
        sectionsTableView.dataSource = self
        sectionsTableView.publisher(for: \.contentSize)
            .sink { newContentSize in
                self.tableViewHeight.constant = newContentSize.height
            }
            .store(in: &tokens)
        
        self.bannerImage.image = course?.banner
        self.backgroundImage.image = course?.background
        self.titleLabel.text = course?.title
        self.subtitleLabel.text = course?.subtitle
        self.descriptionLabel.text = course?.description
        self.authorLabel.text = "Taught by \(course?.authors?.formatted(.list(type: .and, width: .standard)) ?? "Design+Code")"
        self.iconImageView.image = course?.icon
        
        let menu = UIMenu(
            title: "Course Options",
            options: .displayInline,
            children: [
                UIAction(title: "Share", image: UIImage(systemName: "square.and.arrow.up"), handler: { _ in
                    // Share Course
                }),
                UIAction(title: "Take Test", image: UIImage(systemName: "highlighter"), handler: { _ in
                    // Take Test
                }),
                UIAction(title: "Download", image: UIImage(systemName: "square.and.arrow.down"), handler: { _ in
                    // Download Course
                }),
                UIAction(title: "Forums", image: UIImage(systemName: "chevron.left.forwardslash.chevron.right"), handler: { _ in
                    // Forums
                }),
            ]
        )
        menuButton.showsMenuAsPrimaryAction = true
        menuButton.menu = menu
    }

    @IBAction func goBack(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}

extension CoursesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension CoursesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        course?.sections.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SectionCell", for: indexPath) as! SectionTableViewCell
        if let selectedSection = course?.sections[indexPath.row] {
            cell.titleLabel.text = selectedSection.sectionTitle
            cell.subtitleLabel.text = selectedSection.sectionSubtitle
            cell.descriptionLabel.text = selectedSection.sectionDescription
            cell.courseLogo.image = selectedSection.sectionIcon
        }
        return cell
    }
    
}
