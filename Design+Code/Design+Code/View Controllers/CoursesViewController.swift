//
//  CoursesViewController.swift
//  Design+Code
//
//  Created by Volodymyr Myroniuk on 12.07.2023.
//

import UIKit

class CoursesViewController: UIViewController {
    
    var course: Course?

    override func viewDidLoad() {
        super.viewDidLoad()
        print("This course is \(course?.title ?? "")")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
