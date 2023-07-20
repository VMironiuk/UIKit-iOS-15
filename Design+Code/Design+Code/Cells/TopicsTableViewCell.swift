//
//  TopicsTableViewCell.swift
//  Design+Code
//
//  Created by Volodymyr Myroniuk on 20.07.2023.
//

import UIKit

class TopicsTableViewCell: UITableViewCell {

    @IBOutlet var topicLabel: UILabel!
    @IBOutlet var topicIcon: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
