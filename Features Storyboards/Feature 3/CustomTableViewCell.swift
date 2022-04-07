//
//  CustomTableViewCell.swift
//  CSUF_Explorer
//
//  Created by Nhan Mac on 4/6/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet var imgAvatar: UIImageView!
    

    @IBOutlet var reviewText: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
