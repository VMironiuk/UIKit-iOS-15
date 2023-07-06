//
//  FeaturedViewController.swift
//  Design+Code
//
//  Created by Volodymyr Myroniuk on 30.06.2023.
//

import UIKit

final class FeaturedViewController: UIViewController {

    @IBOutlet private weak var cardView: CustomView!
    @IBOutlet private weak var handbooksCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        handbooksCollectionView.delegate = self
        handbooksCollectionView.dataSource = self
        handbooksCollectionView.layer.masksToBounds = false
        
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
