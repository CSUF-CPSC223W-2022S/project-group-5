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
    @IBOutlet var textName: UILabel!
    
    static let id = "CustomTableViewCell"

    
    static func nib() -> UINib {
        return UINib(nibName: "CustomTableViewCell", bundle: nil)
    }
    
    public func configure(review: Reviews) {
        reviewText.text = review.comment
        imgAvatar.image = UIImage(named: review.avartar ?? "CSUF")
        textName.text = review.name
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
