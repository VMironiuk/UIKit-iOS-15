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
    @IBOutlet weak var sectionsTableView: UITableView!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    
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
        sectionsTableView.rowHeight = UITableView.automaticDimension
        sectionsTableView.estimatedRowHeight = UITableView.automaticDimension
        
        self.bannerImage.image = course?.banner
        self.backgroundImage.image = course?.background
        self.titleLabel.text = course?.title
        self.subtitleLabel.text = course?.subtitle
        self.descriptionLabel.text = course?.description
        self.authorLabel.text = "Taught by \(course?.authors?.formatted(.list(type: .and, width: .standard)) ?? "Design+Code")"
    }

    @IBAction func goBack(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}

extension CoursesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
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
