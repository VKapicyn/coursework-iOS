//
//  GuidesController.swift
//  GetGuide
//
//  Created by Владислав Капицын on 29.03.2021.
//

import UIKit

class GuidesController: UIViewController {
    
    var loader = Loader()
    
    private var data: [Guide] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    var guideId = 0
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.data = loader.load()
        
        GuideSinglton.shared.guide = Guide(
            id: data[0].id,
            contact: data[0].contact,
            rait: data[0].rait,
            firstName: data[0].firstName,
            lastName: data[0].lastName,
            avatar: data[0].avatar,
            comment: data[0].comment,
            place: data[0].place
        )

        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 200
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "newGuide",
              let _ = segue.destination as? GuideViewController
        else {
            return
        }
    }
}

extension GuidesController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GuideTableViewCell") as! GuideTableViewCell
        cell.setup(from: data[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        GuideSinglton.shared.guide?.id = data[indexPath.row].id
        performSegue(withIdentifier: "newGuide", sender: nil)
    }
}
