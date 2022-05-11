//
//  AmenityLocation.swift
//  CSUF_Explorer
//
//  Created by David Santana on 3/9/22.
//

import Foundation

class AmenityLocation: Location {
    init(lat: Double, long: Double, name: String, type: String) {
        super.init(lat: lat, long: long, name: name)
        self.type = type
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
}
