//
//  NearbyLocation.swift
//  CSUF_Explorer
//
//  Created by Arriana on 5/11/22.
//

import Foundation

class NearbyLocation : Location {
    var todaysHours : String {
        let temp = LocationCard()
        
        let today = temp.getDayOfWeek() ?? ""
        
        return self.hours[today] ?? "\(today) Hours"
    }
    
    override init(lat: Double, long: Double, name: String) {
        super.init(lat: lat, long: long, name: name)
        initDays()
    }
    
    init(lat: Double, long: Double, name: String, location : String)
    {
        super.init(lat: lat, long: long, name: name)
        self.address = location
        initDays()
    }
    
    func initDays()
    {
        self.hours["Tuesday"] = "Hours"
        self.hours["Wednesday"] = "Hours"
        self.hours["Thursday"] = "Hours"
        self.hours["Friday"] = "Hours"
        self.hours["Saturday"] = "Hours"
        self.hours["Sunday"] = "Hours"
    }
    
    func setAllHours(hour: String)
    {
        for (day, _) in self.hours{
            self.hours[day] = hour
        }
    }
}
