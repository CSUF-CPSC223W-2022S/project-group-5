//
//  Location.swift
//  CSUF_Explorer
//
//  Created by David Santana on 3/8/22.
//

import Foundation

class Location {
    var lat: Double
    var long: Double
    var name: String
    var description: String?
    var hours = ["monday": ""]
    var type: String?
    var logo: String?
    var address: String?

    init(lat: Double, long: Double, name: String) {
        self.lat = lat
        self.long = long
        self.name = name
    }

    static func ==(left: Location, right: String) -> Bool {
        return left.name == right
    }
}
