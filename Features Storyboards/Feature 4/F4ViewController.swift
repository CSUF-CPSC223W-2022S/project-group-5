//
//  F4ViewController.swift
//  CSUF_Explorer
//
//  Created by David Santana on 3/18/22.
//

import UIKit

class F4ViewController: UIViewController {
    
    
    @IBOutlet var nearbytableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nearbytableView.delegate = self
        nearbytableView.dataSource = self

        // Do any additional setup after loading the view.
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
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let nearbyCell = nearbytableView.dequeueReusableCell(withIdentifier: "nearbyViewCell", for: indexPath)
        nearbyCell.textLabel?.text = "Test Cell"
        return nearbyCell
    }
    
}
