//
//  CustomTabBarViewController.swift
//  Design+Code
//
//  Created by Volodymyr Myroniuk on 18.07.2023.
//

import UIKit

class CustomTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.tintColor = UIColor(named: "TabBarTint")
        
        tabBar.layer.cornerRadius = 30.0
        tabBar.layer.masksToBounds = true
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        tabBar.selectionIndicatorImage = UIImage(named: "Selected")
        additionalSafeAreaInsets.bottom = 20
    }

}
