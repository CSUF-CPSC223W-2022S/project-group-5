//
//  SB1ViewController.swift
//  CSUF_Explorer
//
//  Created by Minh Nguyen on 3/10/22.
//

import UIKit
import MapKit

struct Building {
  var name: String
  var lattitude: CLLocationDegrees
  var longtitude: CLLocationDegrees
}


class SB1ViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    let radius: CLLocationDistance = 500

    let startingLocation = CLLocation(latitude: 33.88194108771796, longitude: -117.88534289916993)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //setting starting location
        setStartingPosition()
        let Buildings = getBuildingLocation()
        setAnnotation(Buildings: Buildings)
        
        //set image
//        self.title = "Map"
        self.tabBarItem.image = UIImage(named: "Map")
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        isLocationServiceEnabled()
    }
    
    
    func setStartingPosition(){
        
        let position =  MKCoordinateRegion(center: startingLocation.coordinate,
                                           latitudinalMeters: radius,
                                           longitudinalMeters: radius)
    
        mapView.setRegion(position, animated: true)
    }
    
    func isLocationServiceEnabled(){
        if CLLocationManager.locationServicesEnabled(){
            checkAuthorizationStatus()
        }
        else{
            displayAlert(isServiceEnabled: true)
        }
    }
    
    func checkAuthorizationStatus(){
        
        let status = CLLocationManager.authorizationStatus()
        if status == .authorizedAlways || status == .authorizedWhenInUse {
            mapView.showsUserLocation = true
        }
        else if status == .restricted || status == .denied {
            displayAlert(isServiceEnabled: false)
        }
        else if status == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
            mapView.showsUserLocation = true
        }
        
    }
    
    func displayAlert(isServiceEnabled:Bool){
        let serviceEnableMessage = "Location services must to be enabled. You can enable location services in your settings."
        let authorizationStatusMessage = "Please authorize this app for more map features"
        
        let message = isServiceEnabled ? serviceEnableMessage : authorizationStatusMessage
        
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        
        //create ok button
        let acceptAction = UIAlertAction(title: "OK", style: .default)
        
        //add ok button to alert
        alert.addAction(acceptAction)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    func getBuildingLocation() -> [Building]{
        return [
            Building(name: "Titan Shops", lattitude: 33.881860925118076, longtitude: -117.88689858039857),
            Building(name: "Titan Student Union", lattitude: 33.88143338998001, longtitude: -117.8876066835785),
            Building(name: "Mihaylo Building", lattitude: 33.87867662759899, longtitude: -117.883358064499),
            Building(name: "Carl's Jr.", lattitude: 33.87933799147634, longtitude: -117.8838703664209),
            Building(name: "Computer Science Building", lattitude: 33.88230404521395, longtitude: -117.8826660545732),
            Building(name: "Computer Engineering Building", lattitude: 33.882312952126945, longtitude: -117.88322931846633),
            Building(name: "Titan Gymasium", lattitude: 33.88305222266506, longtitude: -117.88613951524749),
            Building(name: "Pollak Library", lattitude: 33.881355453656326, longtitude: -117.88541531881347)
        ]
        //https://www.gps-coordinates.net
    }
    
    func setAnnotation(Buildings:[Building]){
        
        for Building in Buildings {
            let annotation = MKPointAnnotation()
            annotation.title = Building.name
            
            
            annotation.coordinate = CLLocationCoordinate2D(latitude:Building.lattitude,
                                                         longitude: Building.longtitude)
            mapView.addAnnotation(annotation)
        }
    }
}
