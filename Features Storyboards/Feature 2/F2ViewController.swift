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
        return cell
    }

    var locationList = [FoodLocation]()
    func addLocations() {
        let location1 = FoodLocation(lat: 1.2, long: 1.2, name: "Carl's Jr")
        location1.address = "123 S Sesame St"
        location1.hours["monday"] = "10am to 10pm"
        locationList.append(location1)

        let location2 = FoodLocation(lat: 1.2, long: 1.2, name: "Starbucks")
        location2.address = "123 S Sesame St"
        location2.hours["monday"] = "10am to 10pm"
        locationList.append(location2)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 267
    }

//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 20
//    }

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
}
