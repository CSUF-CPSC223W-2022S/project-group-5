//
//  F3ViewController.swift
//  CSUF_Explorer
//
//  Created by Nhan Mac on 5/10/22.
//

import UIKit

class F3ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var reviewList = [Reviews]()

    func loadReviews() {
        // let location1 = Reviews(id: 1, place_id: 1, name: "abc", star: 5, comment: "abc", description: "abc", avartar: nil)
        // locationList.append(location1)

        // let location2 = Reviews(id: 2, place_id: 2, name: "def", star: 5, comment: "def", description: "def", avartar: nil)
        // locationList.append(location2)

        let db = DBConnect()
        reviewList = db.getAllReviews()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.id, for: indexPath) as! CustomTableViewCell
        cell.configure(review: reviewList[indexPath.section])
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return reviewList.count
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }

    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadReviews()
        // Do any additional setup after loading the view.
        tableView.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.id)
        tableView.delegate = self
        tableView.dataSource = self
        // self.view.layoutIfNeeded()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        loadReviews()
        tableView.reloadData()
    }
}
