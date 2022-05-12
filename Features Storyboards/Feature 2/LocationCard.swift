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

    func getDayOfWeek() -> String? {
        let date1 = Date()
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd"
        let date = df.string(from: date1)

        let weekDays = [
            "Sunday",
            "Monday",
            "Tuesday",
            "Wednesday",
            "Thursday",
            "Friday",
            "Saturday"
        ]

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        guard let myDate = formatter.date(from: date) else { return nil }

        let myCalendar = Calendar(identifier: .gregorian)
        let weekDay = myCalendar.component(.weekday, from: myDate)

        return weekDays[weekDay - 1]
    }

    // returns an integer from 1 - 7, with 1 being Sunday and 7 being Saturday
    public func configure(location: Location) {
        let today = getDayOfWeek() ?? "none"
        print()
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
