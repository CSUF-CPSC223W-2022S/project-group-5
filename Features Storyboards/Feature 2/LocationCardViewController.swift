//
//  LocationCardViewController.swift
//  CSUF_Explorer
//
//  Created by David Santana on 4/7/22.
//

import UIKit

class LocationCardViewController: UIViewController {
    @IBOutlet var locationImage: UIImageView!
    @IBOutlet var LocationLabel: UILabel!
    var location: Location = .init(lat: 0, long: 0, name: "")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        LocationLabel.text = location.name
        locationImage.image = UIImage(named: (location.logo ?? "csuf") + "_image")
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
