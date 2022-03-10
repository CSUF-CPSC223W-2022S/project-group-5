//
//  Location.swift
//  CSUF_Explorer
//
//  Created by Minh Nguyen on 3/9/22.
//

import Foundation

class Identifiers {
    var lat: Double
    var long: Double
    var name: String

    init(lat: Double, long: Double, name: String) {
        self.lat = lat
        self.long = long
        self.name = name
    }
}
