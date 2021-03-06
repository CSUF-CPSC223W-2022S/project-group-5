//
//  LocationTests.swift
//  CSUF_ExplorerTests
//
//  Created by David Santana on 3/9/22.
//

@testable import CSUF_Explorer
import Foundation
import XCTest

class LocationTests: XCTestCase {
    func testInitLocation() {
        let newLocation = Location(lat: 1.1, long: 1.2, name: "Park")
        XCTAssertEqual(newLocation.lat, 1.1)
    }

    func testInitFoodLocation() {
        let newFoodLocation = FoodLocation(lat: 1.1, long: 1.2, name: "Carls Jr")
        XCTAssertEqual(newFoodLocation.type, "food")
    }

    func testInitAmenityLocation() {
        let newAmenityLocation = AmenityLocation(lat: 1.1, long: 1.2, name: "Gym", type: "health")
        XCTAssertEqual(newAmenityLocation.type, "health")
    }

    func testLocationSearch() {
        let location1 = Location(lat: 1.1, long: 1.2, name: "Location 1")
        let location2 = Location(lat: 1.1, long: 1.2, name: "Location 2")
        let location3 = Location(lat: 1.1, long: 1.2, name: "Location 3")
        let allLocations = [location1, location2, location3]

        let searchList = SearchLocation(locationList: allLocations)
        XCTAssertEqual(searchList.findLocation(name: "Location 2"), 1)
        XCTAssertEqual(searchList.findLocation(name: "Location 1"), 0)
        XCTAssertEqual(searchList.findLocation(name: "Location 3"), 2)
        XCTAssertEqual(searchList.findLocation(name: "Location 10"), -1)
    }
}
