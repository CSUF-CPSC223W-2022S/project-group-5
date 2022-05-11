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
        //initExampleData()
    }
    
    func initExampleData(){
        let r1 = Reviews(id: 1, place_id: 1, name: "Nhan", star: 5, comment: "abc", description: "abc", avartar: nil)
        let r2 = Reviews(id: 2, place_id: 2, name: "John", star: 5, comment: "def", description: "def", avartar: nil)
        insertReview(review: r1)
        insertReview(review: r2)
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
    
    func createTable(createTableString: String) -> Int{
        var count: Int = 0
        var createTableStatement: OpaquePointer?
        if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK {
            if sqlite3_step(createTableStatement) == SQLITE_DONE {
                print("person table created.")
                count = 1
            } else {
                print("person table could not be created.")
                count = 0
            }
        } else {
            print("CREATE TABLE statement could not be prepared.")
            count = 0
        }
        sqlite3_finalize(createTableStatement)
        return count
    }
    
    func insertPlaces(place: Places) -> Int{
        var count: Int = 0
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
                count = 1
            } else {
                print("Could not insert row.")
                count = 0
            }
        } else {
            print("INSERT statement could not be prepared.")
            count = 0
        }
        sqlite3_finalize(insertStatement)
        return count
    }
    
    func insertReview(review: Reviews)  -> Int{
        var count: Int = 0
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
                count = 1
            } else {
                print("Could not insert row.")
                count = 0
            }
        } else {
            print("INSERT statement could not be prepared.")
            count = 0
        }
        sqlite3_finalize(insertStatement)
        return count
    }
    
    func getAllPlaces() -> [Places]{
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

                places.append(Places(id: Int(id), name: name, address: address, lattitude: coor.latitude, longtitude: coor.longitude, description: desc))
                print(places)
            }
        } else {
            print("SELECT statement could not be prepared")
        }
        sqlite3_finalize(queryStatement)
        return places
    }
    
    func getAllReviews() -> [Reviews] {
        let queryStatementString = "SELECT * FROM reviews order by id desc;"
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
                reviews.append(Reviews(id: Int(id), place_id: Int(placeID), name: name, star: Int(star), comment: comment, description: desc))
                print(reviews)
            }
        } else {
            print("SELECT statement could not be prepared")
        }
        sqlite3_finalize(queryStatement)
        return reviews
    }
}
