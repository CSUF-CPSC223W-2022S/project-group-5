//
//  DBConnect.swift
//  CSUF_Explorer
//
//  Created by Nhan Mac on 3/23/22.
//

import Foundation
import MapKit
import SQLite3

class DBConnect {
    let dbPath: String = "CSUFExplorer.sqlite"
    let createTablePlacesString = "CREATE TABLE IF NOT EXISTS Places (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, address TEXT, long TEXT, lat TEXT, description TEXT)"
    let createTableReviewsString = "CREATE TABLE IF NOT EXISTS Reviews (id INTEGER PRIMARY KEY AUTOINCREMENT, place_id INTEGER, name TEXT, star INTEGER, comment TEXT, description TEXT)"
    
    var db: OpaquePointer?
    
    init() {
        db = openDatabase()
        createTable(createTableString: createTablePlacesString)
        createTable(createTableString: createTableReviewsString)
    }
    
    func openDatabase() -> OpaquePointer? {
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent(dbPath)
        var db: OpaquePointer?
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("error opening database")
            return nil
        } else {
            print("Successfully opened connection to database at \(dbPath)")
            return db
        }
    }
    
    func createTable(createTableString: String) {
        var createTableStatement: OpaquePointer?
        if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK {
            if sqlite3_step(createTableStatement) == SQLITE_DONE {
                print("person table created.")
            } else {
                print("person table could not be created.")
            }
        } else {
            print("CREATE TABLE statement could not be prepared.")
        }
        sqlite3_finalize(createTableStatement)
    }
    
    func insertPlaces(place: Places) {
        let insertStatementString = "INSERT INTO Places (name, address, long, lat, description) VALUES (?,?,?,?,?);"
        var insertStatement: OpaquePointer?
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            sqlite3_bind_text(insertStatement, 1, (place.name as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 2, (place.address as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 3, (String(place.longtitude) as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 4, (String(place.lattitude) as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 5, (place.description as NSString).utf8String, -1, nil)
                
            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print("Successfully inserted row.")
            } else {
                print("Could not insert row.")
            }
        } else {
            print("INSERT statement could not be prepared.")
        }
        sqlite3_finalize(insertStatement)
    }
    
    func insertReview(review: Reviews) {
        let insertStatementString = "INSERT INTO Reviews (place_id, name, star, comment, description) VALUES (?,?,?,?,?);"
        var insertStatement: OpaquePointer?
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            sqlite3_bind_int(insertStatement, 1, Int32(review.place_id))
            sqlite3_bind_text(insertStatement, 2, (review.name as NSString).utf8String, -1, nil)
            sqlite3_bind_int(insertStatement, 1, Int32(review.star))
            sqlite3_bind_text(insertStatement, 4, (review.comment as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 5, (review.description as NSString).utf8String, -1, nil)
                
            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print("Successfully inserted row.")
            } else {
                print("Could not insert row.")
            }
        } else {
            print("INSERT statement could not be prepared.")
        }
        sqlite3_finalize(insertStatement)
    }
    
    func getAllPlaces() -> [Places] {
        let queryStatementString = "SELECT * FROM places;"
        var queryStatement: OpaquePointer?
        var places: [Places] = []
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                let id = sqlite3_column_int(queryStatement, 0)
                let name = String(describing: String(cString: sqlite3_column_text(queryStatement, 1)))
                let address = String(describing: String(cString: sqlite3_column_text(queryStatement, 2)))
                let long = String(describing: String(cString: sqlite3_column_text(queryStatement, 3)))
                let lat = String(describing: String(cString: sqlite3_column_text(queryStatement, 4)))
                let desc = String(describing: String(cString: sqlite3_column_text(queryStatement, 5)))
                    
                let dbLat = Double(lat) // Convert String to double
                let dbLong = Double(long)
                let coor = CLLocationCoordinate2D(latitude: dbLat!, longitude: dbLong!)

                places.append(Places(id: Int(id), name: name, address: address, description: desc, lat: coor.latitude, long: coor.longitude))
                print(places)
            }
        } else {
            print("SELECT statement could not be prepared")
        }
        sqlite3_finalize(queryStatement)
        return places
    }
    
    func getAllReviews() -> [Reviews] {
        let queryStatementString = "SELECT * FROM reviews;"
        var queryStatement: OpaquePointer?
        var reviews: [Reviews] = []
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                let id = sqlite3_column_int(queryStatement, 0)
                let placeID = sqlite3_column_int(queryStatement, 1)
                let name = String(describing: String(cString: sqlite3_column_text(queryStatement, 2)))
                let star = sqlite3_column_int(queryStatement, 3)
                let comment = String(describing: String(cString: sqlite3_column_text(queryStatement, 4)))
                let desc = String(describing: String(cString: sqlite3_column_text(queryStatement, 5)))
                reviews.append(Reviews(id: Int(id), placeID: placeID, name: name, description: desc, star: star, comment: comment))
                print(reviews)
            }
        } else {
            print("SELECT statement could not be prepared")
        }
        sqlite3_finalize(queryStatement)
        return reviews
    }
}
