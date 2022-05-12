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
        (NearbyLocation)(lat: 1.2, long: 1.2, name: "The Port of Peri Peri", location: "2555 E Chapman Ave"),
        (NearbyLocation)(lat: 1.2, long: 1.2, name: "Able Coffee Roasters", location: "2736 Nutwood Ave Suite D"),
        (NearbyLocation)(lat: 1.2, long: 1.2, name: "Ensenada's Surf N Turf Grill", location: "2931 Nutwood Ave"),
        (NearbyLocation)(lat: 1.2, long: 1.2, name: "Jack in the Box", location: "751 N Placentia Ave"),
        (NearbyLocation)(lat: 1.2, long: 1.2, name: "Kung Fu Tea", location: "729 N Placentia Ave"),
        (NearbyLocation)(lat: 1.2, long: 1.2, name: "Sonic Drive-In", location: "441 N Placentia Ave"),
        (NearbyLocation)(lat: 1.2, long: 1.2, name: "Pepe's", location: "821 N Placentia Ave"),
        (NearbyLocation)(lat: 1.2, long: 1.2, name: "Bundoo Khan", location: "2736 Nutwood Ave Suite A"),
        (NearbyLocation)(lat: 1.2, long: 1.2, name: "Taco Bell", location: "3000 Yorba Linda Blvd"),
        (NearbyLocation)(lat: 1.2, long: 1.2, name: "Dollar Tree", location: "2465 E Chapman Ave"),
        (NearbyLocation)(lat: 1.2, long: 1.2, name: "Del Taco", location: "1941 N Placentia Ave"),
        (NearbyLocation)(lat: 1.2, long: 1.2, name: "Mr. Katsu", location: "3165 Yorba Linda Blvd"),
        (NearbyLocation)(lat: 1.2, long: 1.2, name: "Sharetea Fullerton", location: "2445 E Chapman Ave"),
        (NearbyLocation)(lat: 1.2, long: 1.2, name: "Philz Coffee", location: "520 N State College Blvd"),
        (NearbyLocation)(lat: 1.2, long: 1.2, name: "85°C Bakery Cafe", location: "535 N Commonwealth Ave"),
        (NearbyLocation)(lat: 1.2, long: 1.2, name: "Subway", location: "2514 E Chapman Ave"),
        (NearbyLocation)(lat: 1.2, long: 1.2, name: "Fraise Cafe", location: "2504 E Chapman Ave"),
        (NearbyLocation)(lat: 1.2, long: 1.2, name: "Del Taco", location: "1941 N Placentia Ave"),
        (NearbyLocation)(lat: 1.2, long: 1.2, name: "Afters Ice Cream", location: "339 N State College Blvd"),
        (NearbyLocation)(lat: 1.2, long: 1.2, name: "Mr BBQ", location: "305 N State College Blvd")
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
        nearbyLocations[0].setAllHours(hour: "11AM-9PM")
        nearbyLocations[1].type = "Drink"
        nearbyLocations[1].setAllHours(hour: "7AM-6PM")
        nearbyLocations[2].type = "Food"
        nearbyLocations[2].setAllHours(hour: "10AM-9PM")
        nearbyLocations[3].type = "Food"
        nearbyLocations[3].setAllHours(hour: "Open 24 Hours")
        nearbyLocations[4].type = "Drink"
        nearbyLocations[4].setAllHours(hour: "12-8PM")
        nearbyLocations[5].type = "Food"
        nearbyLocations[5].setAllHours(hour: "10AM-2AM")
        nearbyLocations[6].type = "Food"
        nearbyLocations[6].setAllHours(hour: "6AM-10PM")
        nearbyLocations[7].type = "Food"
        nearbyLocations[7].setAllHours(hour: "11AM-10PM")
        nearbyLocations[8].type = "Food"
        nearbyLocations[8].setAllHours(hour: "7AM-3PM")
        nearbyLocations[9].type = "Amenity"
        nearbyLocations[9].setAllHours(hour: "8AM-10PM")
        nearbyLocations[10].type = "Food"
        nearbyLocations[10].setAllHours(hour: "Open 24 Hours")
        nearbyLocations[11].type = "Food"
        nearbyLocations[11].setAllHours(hour: "11:30AM-8PM")
        nearbyLocations[12].type = "Drink"
        nearbyLocations[12].setAllHours(hour: "11:30AM-10PM")
        nearbyLocations[13].type = "Drink"
        nearbyLocations[13].setAllHours(hour: "6AM-7PM")
        nearbyLocations[14].type = "Food"
        nearbyLocations[14].setAllHours(hour: "8AM-8PM")
        nearbyLocations[15].type = "Food"
        nearbyLocations[15].setAllHours(hour: "Open 24 Hours")
        nearbyLocations[16].type = "Food"
        nearbyLocations[16].setAllHours(hour: "11AM-9PM")
        nearbyLocations[17].type = "Food"
        nearbyLocations[17].setAllHours(hour: "8AM-8PM")
        nearbyLocations[18].type = "Food"
        nearbyLocations[0].setAllHours(hour: "11AM-9PM")
        nearbyLocations[19].type = "Food"
        nearbyLocations[0].setAllHours(hour: "11AM-9PM")
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
        cell.locationTime.text  = nearbyLocations[indexPath.row].todaysHours
        cell.locationImage.image = UIImage(named: nearbyLocations[indexPath.row].type ?? "")
        
        return cell
    }
    
}
