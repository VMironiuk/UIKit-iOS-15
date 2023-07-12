//
//  FeaturedViewController.swift
//  Design+Code
//
//  Created by Volodymyr Myroniuk on 30.06.2023.
//

import UIKit
import Combine

final class FeaturedViewController: UIViewController {

    @IBOutlet private weak var cardView: CustomView!
    @IBOutlet private weak var handbooksCollectionView: UICollectionView!
    @IBOutlet private weak var coursesTableView: UITableView!
    @IBOutlet private weak var tableViewHeight: NSLayoutConstraint!
    @IBOutlet private weak var scrollView: UIScrollView!
    
    private var tokens: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        handbooksCollectionView.delegate = self
        handbooksCollectionView.dataSource = self
        handbooksCollectionView.layer.masksToBounds = false
        
        coursesTableView.delegate = self
        coursesTableView.dataSource = self
        coursesTableView.layer.masksToBounds = false
        coursesTableView.publisher(for: \.contentSize)
            .sink { newContentSize in
                self.tableViewHeight.constant = newContentSize.height
            }
            .store(in: &tokens)
        
        scrollView.delegate = self
        
//        cardView.layer.cornerCurve = .continuous
//        cardView.layer.cornerRadius = 30
//        blurView.layer.cornerCurve = .continuous
//        blurView.layer.cornerRadius = 30
//        blurView.layer.masksToBounds = true
//
//        cardView.layer.shadowColor = UIColor(named: "Shadow")?.cgColor
//        cardView.layer.shadowOpacity = 0.5
//        cardView.layer.shadowOffset = CGSize(width: 0, height: 10)
//        cardView.layer.shadowRadius = 20
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailVC = segue.destination as? CoursesViewController, let course = sender as? Course {
            detailVC.course = course
        }
    }

}

extension FeaturedViewController: UICollectionViewDelegate {}

extension FeaturedViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        handbooks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "CourseCell",
            for: indexPath) as! HandbookCollectionViewCell
        let handbook = handbooks[indexPath.item]
        
        cell.titleLabel.text = handbook.title
        cell.subtitleLabel.text = handbook.subtitle
        cell.descriptionLabel.text = handbook.description
        cell.gradient.colors = handbook.colors
        cell.logo.image = handbook.icon
        cell.banner.image = handbook.banner
        
        return cell
    }
    
}

extension FeaturedViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedCourse = courses[indexPath.section]
        performSegue(withIdentifier: "presentCourse", sender: selectedCourse)
    }
    
}

extension FeaturedViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        courses.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        section == 0 ? 0 : 20
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoursesTableCell", for: indexPath) as! CoursesTableViewCell
        let course = courses[indexPath.section]
        
        cell.titleLabel.text = course.title
        cell.subtitleLabel.text = course.subtitle
        cell.descriptionLabel.text = course.description
        cell.courseBackground.image = course.background
        cell.courseBanner.image = course.banner
        cell.courseLogo.image = course.icon
        
        return cell
    }
    
}

extension FeaturedViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentHeight = scrollView.contentSize.height
        let lastScrollYPos = scrollView.contentOffset.y
        
        let percentage = lastScrollYPos / contentHeight
        if percentage <= 0.15 {
            title = "Featured"
        } else if percentage <= 0.33 {
            title = "Handbooks"
        } else {
            title = "Courses"
        }
    }
    
}
