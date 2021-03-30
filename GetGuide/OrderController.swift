//
//  OrderController.swift
//  GetGuide
//
//  Created by Владислав Капицын on 30.03.2021.
//

import UIKit

class OrderController: UIViewController {
    
    @IBOutlet weak var contactLabel: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        updateGuie()
    }
    
    private func updateGuie() {
        let loader = Loader()
        DispatchQueue.main.async {
            GuideSinglton.shared.guide = loader.getGuide(guideId: GuideSinglton.shared.guide!.id)
            self.contactLabel.text = "\(GuideSinglton.shared.guide!.contact)"
            self.placeLabel.text = "\(GuideSinglton.shared.guide!.place)"
        }
    }
}
