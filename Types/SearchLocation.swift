//
//  Search.swift
//  CSUF_ExplorerTests
//
//  Created by David Santana on 3/12/22.
//

import Foundation

struct SearchLocation {
    var locationList: [Location]
    init(locationList: [Location]) {
        self.locationList = locationList
    }

    func findLocation(name: String) -> Int {
        for (index, loc) in locationList.enumerated() {
            if loc == name {
                return index
            }
        }
        return -1
    }
}
