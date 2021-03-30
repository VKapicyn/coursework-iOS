//
//  GuideViewController.swift
//  GetGuide
//
//  Created by Владислав Капицын on 30.03.2021.
//

import UIKit
import SDWebImage

class GuideViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        updateGuie()
    }
    
    private func updateGuie() {
        let loader = Loader()
        DispatchQueue.main.async {
            GuideSinglton.shared.guide = loader.getGuide(guideId: GuideSinglton.shared.guide!.id)
            self.nameLabel.text = "\(GuideSinglton.shared.guide!.firstName) \(GuideSinglton.shared.guide!.lastName)"
            self.placeLabel.text = "\(GuideSinglton.shared.guide!.place)"
            self.commentLabel.text = "\(GuideSinglton.shared.guide!.comment)"
            self.rateLabel.text = "\(GuideSinglton.shared.guide!.rait)"
            guard let url = URL(string: GuideSinglton.shared.guide!.avatar) else { return }
            self.imageView.sd_setImage(with: url, completed: nil)
        }
    }
}
