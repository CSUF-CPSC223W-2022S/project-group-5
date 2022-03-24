//
//  LocationCard.swift
//  CSUF_Explorer
//
//  Created by David Santana on 3/19/22.
//

import UIKit

class LocationCard: UITableViewCell {
    static let id = "LocationCard"
    static func nib() -> UINib {
        return UINib(nibName: "LocationCard", bundle: nil)
    }

    public func configure(location: Location) {
        let today = "monday"

        locationTitle.text = location.name
        locationAddress.text = location.address
        locationHours.text = "Open Today: \(location.hours[today] ?? "")"
        locationLogo.image = UIImage(named: location.logo ?? "CSUF")
    }

    @IBOutlet var locationTitle: UILabel!
    @IBOutlet var locationAddress: UILabel!
    @IBOutlet var locationHours: UILabel!
    @IBOutlet var locationLogo: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        locationLogo.contentMode = .scaleAspectFit
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
