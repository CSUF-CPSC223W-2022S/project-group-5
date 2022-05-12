//
//  NewReviewsViewController.swift
//  CSUF_Explorer
//
//  Created by Nhan Mac on 5/10/22.
//

import UIKit

class NewReviewsViewController: UIViewController {

    @IBOutlet var comment: UITextField!
    @IBOutlet var name: UITextField!
    //@IBOutlet var name: UITextField!
    //@IBOutlet var comment: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitReviews(_ sender: Any) {
        let review = Reviews(id: 0, place_id: 0, name: name.text ?? "No Comment", star: 5, comment: comment.text ?? "No Comment", description: "", avartar: nil)
        let db = DBConnect()
        if db.insertReview(review: review) == 1 {
            print("go back")
            if let nav = self.navigationController {
                    nav.popViewController(animated: true)
                } else {
                    self.dismiss(animated: true, completion: nil)
                }
        }
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
