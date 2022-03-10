//
//  CSE_tests.swift
//  CSUF_ExplorerUITests
//
//  Created by Minh Nguyen on 3/9/22.
//

import Foundation
@testable import CSUF_Explorer
import XCTest

class MapTests: XCTestCase {
    func testInitLocation() {
        let newID = Identifiers(lat: 1.1, long: 1.2, name: "Park")
        XCTAssertEqual(newID.lat, 1.1)
    }
}
