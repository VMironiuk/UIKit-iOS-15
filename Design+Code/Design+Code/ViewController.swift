//
//  ViewController.swift
//  Design+Code
//
//  Created by Volodymyr Myroniuk on 30.06.2023.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet private weak var cardView: CustomView!
    @IBOutlet private weak var handbooksCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        handbooksCollectionView.delegate = self
        handbooksCollectionView.dataSource = self
        
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

extension ViewController: UICollectionViewDelegate {}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CourseCell", for: indexPath) as! HandbookCollectionViewCell
        
        cell.titleLabel.text = "SwiftUI Handbook"
        cell.subtitleLabel.text = "20 SECTIONS - 3 HOURS"
        cell.descriptionLabel.text = "Learn about all the basics of SwiftUI"
        cell.gradient.colors = [UIColor.red.cgColor, UIColor.systemPink.cgColor]
        cell.logo.image = UIImage(named: "Logo React")
        cell.banner.image = UIImage(named: "Illustration 2")
        
        return cell
    }
    
}
