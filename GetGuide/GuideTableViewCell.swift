//
//  GuideTableViewCell.swift
//  GetGuide
//
//  Created by Владислав Капицын on 30.03.2021.
//

import UIKit
import SDWebImage

class GuideTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var smallimageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var raitLabel: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    func setup(from guide: Guide) {
        nameLabel?.text = "\(guide.firstName)"
        raitLabel?.text = "\(guide.rait)"
        placeLabel?.text = "\(guide.place)"
        guard let url = URL(string: guide.avatar) else { return }
        smallimageView.sd_setImage(with: url, completed: nil)
    }
}
