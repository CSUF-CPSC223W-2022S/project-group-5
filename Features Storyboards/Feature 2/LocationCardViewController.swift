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

    @IBOutlet var mondayLabel: UILabel!
    @IBOutlet var tuesdayLabel: UILabel!
    @IBOutlet var wednesdayLabel: UILabel!
    @IBOutlet var thursdayLabel: UILabel!
    @IBOutlet var fridayLabel: UILabel!
    @IBOutlet var saturdayLabel: UILabel!
    @IBOutlet var sundayLabel: UILabel!
    var location: Location = .init(lat: 0, long: 0, name: "")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        LocationLabel.text = location.name
        locationImage.image = UIImage(named: (location.logo ?? "csuf") + "_image")

        mondayLabel.text = "Monday: " + location.hours["Monday"]!
        tuesdayLabel.text = "Tuesday: " + location.hours["Tuesday"]!
        wednesdayLabel.text = "Wednesday: " + location.hours["Wednesday"]!
        thursdayLabel.text = "Thursday: " + location.hours["Thursday"]!
        fridayLabel.text = "Friday: " + location.hours["Friday"]!
        saturdayLabel.text = "Saturday: " + location.hours["Saturday"]!
        sundayLabel.text = "Sunday: " + location.hours["Sunday"]!
    }

    /* x
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
     }
     */
}
