//
//  FoodLocation.swift
//  CSUF_Explorer
//
//  Created by David Santana on 3/8/22.
//

import Foundation

class FoodLocation: Location {
    var starsReview: Int?
    var menu: String?

    override init(lat: Double, long: Double, name: String) {
        super.init(lat: lat, long: long, name: name)
        self.type = "food"
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
}
