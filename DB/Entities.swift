//
//  Entities.swift
//  CSUF_Explorer
//
//  Created by Nhan Mac on 3/23/22.
//
import MapKit
import Foundation

struct Places{
    var id: Int
    var name: String
    var address: String
    var lattitude: CLLocationDegrees
    var longtitude: CLLocationDegrees
    var description: String
}

struct Reviews{
    var id: Int
    var place_id: Int
    var name: String
    var star: Int
    var comment: String
    var description: String
}
