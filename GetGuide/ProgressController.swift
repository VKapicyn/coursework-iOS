//
//  ProgressController.swift
//  GetGuide
//
//  Created by Владислав Капицын on 29.03.2021.
//

import UIKit

class ProgressController: UIViewController {
    
    @IBOutlet weak var waitingLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var timeStep1 = 0
        
        var waitingTimer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { timer in
            timeStep1 = timeStep1 + 1

            if (timeStep1 % 3 == 0) {
                self.waitingLabel.text = "Подождите."
            } else if (timeStep1 % 3 == 1)  {
                self.waitingLabel.text = "Подождите.."
            } else if (timeStep1 % 3 == 2) {
                self.waitingLabel.text = "Подождите..."
            }
            
        }
        
        _ = Timer.scheduledTimer(withTimeInterval: 0.4, repeats: true) { timer in
            self.progressView.progress += 0.1
            
            if (self.progressView.progress >=  0.75) {
                self.infoLabel.text = "Осталось совсем чуть-чуть!"
            }
            
            if (self.progressView.progress >= 1) {
                timer.invalidate()
                waitingTimer.invalidate()
                
                self.infoLabel.text = "Готово!"
                self.waitingLabel.text = ""
                
                let GuidesController = self.storyboard?.instantiateViewController(withIdentifier: "GuidesController") as! UIViewController
                self.present(GuidesController, animated: true)
            }
        }
        
    }
}
