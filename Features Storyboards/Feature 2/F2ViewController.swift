//
//  F2ViewController.swift
//  CSUF_Explorer
//
//  Created by David Santana on 3/18/22.
//

import UIKit

class F2ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LocationCard.id, for: indexPath) as! LocationCard
        cell.configure(location: locationList[indexPath.section])
        cell.selectionStyle = .none
        return cell
    }

    var locationList = [FoodLocation]()
    func addLocations() {
        let location1 = FoodLocation(lat: 33.87933799147634, long: -117.8838703664209, name: "Carl's Jr")
        location1.address = "800 N State College Blvd"
        location1.hours["Monday"] = "7AM–11PM"
        location1.hours["Tuesday"] = "7AM–9PM"
        location1.hours["Wednesday"] = "7AM–9PM"
        location1.hours["Thursday"] = "7AM–9PM"
        location1.hours["Friday"] = "7AM–3PM"
        location1.hours["Saturday"] = "10AM–2PM"
        location1.hours["Sunday"] = "Open 24 hours"

        location1.logo = "carlsjr"
        locationList.append(location1)

        let location2 = FoodLocation(lat: 33.881120861504854, long: -117.8853552354667, name: "Starbucks")
        location2.address = "Library"
        location1.address = "800 N State College Blvd"
        location2.hours["Monday"] = "7:30AM-7PM"
        location2.hours["Tuesday"] = "7:30AM-7PM"
        location2.hours["Wednesday"] = "7:30AM-7PM"
        location2.hours["Thursday"] = "7:30AM-7PM"
        location2.hours["Friday"] = "7:30AM-4PM "
        location2.hours["Saturday"] = "Closed"
        location2.hours["Sunday"] = "Closed"
        location2.logo = "starbucks"
        locationList.append(location2)

        let location3 = FoodLocation(lat: 33.88306500893567, long: -117.88752082587962, name: "Titan Gym")
        location3.address = "800 N State College Blvd"
        location3.address = "800 N State College Blvd"
        location3.hours["Monday"] = "6AM–12AM"
        location3.hours["Tuesday"] = "6AM–12AM"
        location3.hours["Wednesday"] = "6AM–12AM"
        location3.hours["Thursday"] = "6AM–12AM"
        location3.hours["Friday"] = "6AM–12AM"
        location3.hours["Saturday"] = "8AM–10PM"
        location3.hours["Sunday"] = "8AM–10PM"
        location3.logo = "gym"
        locationList.append(location3)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 267
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return locationList.count
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }

    @IBOutlet var locationTable: UITableView!
    override func viewDidLoad() {
        addLocations()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationTable.register(LocationCard.nib(), forCellReuseIdentifier: LocationCard.id)
        locationTable.delegate = self
        locationTable.dataSource = self
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let locationSelected = locationList[indexPath.section]
//        if let vc = storyboard?.instantiateViewController(withIdentifier: "LocationVC") as? LocationCardViewController {
//            vc.location = locationSelected
//            navigationController?.pushViewController(vc, animated: true)
//        }
        performSegue(withIdentifier: "LocationCard", sender: indexPath.section)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? LocationCardViewController,
           let blogIndex = sender as? Int
        {
            destination.location = locationList[blogIndex]
        }
    }
}
