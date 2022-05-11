//
//  F4ViewController.swift
//  CSUF_Explorer
//
//  Created by David Santana on 3/18/22.
//

import MapKit
import UIKit

class F4ViewController: UIViewController {
    
    var nearbyLocations : [NearbyLocation] = [
        (NearbyLocation)(lat: 1.2, long: 1.2, name: "Carlos Jr"),
        (NearbyLocation)(lat: 1.2, long: 1.2, name: "Able Coffee Roasters"),
        (NearbyLocation)(lat: 1.2, long: 1.2, name: "Ensenada's Surf N Turf Grill"),
        (NearbyLocation)(lat: 1.2, long: 1.2, name: "Jack in the Box"),
        (NearbyLocation)(lat: 1.2, long: 1.2, name: "Kung Fu Tea"),
        (NearbyLocation)(lat: 1.2, long: 1.2, name: "Sonic Drive-In"),
        (NearbyLocation)(lat: 1.2, long: 1.2, name: "Pepe's"),
        (NearbyLocation)(lat: 1.2, long: 1.2, name: "Bundoo Khan"),
        (NearbyLocation)(lat: 1.2, long: 1.2, name: "Taco Bell"),
        (NearbyLocation)(lat: 1.2, long: 1.2, name: "Short'z"),
        (NearbyLocation)(lat: 1.2, long: 1.2, name: "Del Taco"),
        (NearbyLocation)(lat: 1.2, long: 1.2, name: "Mr. Katsu"),
        (NearbyLocation)(lat: 1.2, long: 1.2, name: "Sharetea Fullerton"),
        (NearbyLocation)(lat: 1.2, long: 1.2, name: "Philz Coffee"),
        (NearbyLocation)(lat: 1.2, long: 1.2, name: "85°C Bakery Cafe")
    ]
    
    @IBOutlet var nearbytableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nearbytableView.delegate = self
        nearbytableView.dataSource = self
        InitLocations()
        // Do any additional setup after loading the view.
    }
    
    func InitLocations()
    {
        nearbyLocations[0].type = "Food"
        nearbyLocations[1].type = "Drink"
        nearbyLocations[1].type = "Drink"
        nearbyLocations[1].type = "Drink"
        nearbyLocations[0].address = "Carlos Jr Address"
        nearbyLocations[1].address = "2736 Nutwood Ave D"
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
extension F4ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nearbyLocations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "nearbyCell") as! NearbyTableViewCell
        
        cell.locationName.text = nearbyLocations[indexPath.row].name
        cell.locationType.text = nearbyLocations[indexPath.row].type
        cell.locationAddress.text = nearbyLocations[indexPath.row].address
        
        
        return cell
    }
    
}
