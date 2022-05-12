//
//  GetLocations.swift
//  CSUF_Explorer
//
//  Created by David Santana on 5/5/22.
//

import Foundation

func getLocationsFromFile(fileName: String) -> Any? {
    var json: Any?
    if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
        do {
            let fileUrl = URL(fileURLWithPath: path)
            // Getting data from JSON file using the file URL
            let data = try Data(contentsOf: fileUrl, options: .mappedIfSafe)
            json = try? JSONSerialization.jsonObject(with: data)
        } catch {
            print(error)
        }
    }
    return json
}
