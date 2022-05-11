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

class SB1ViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    let radius: CLLocationDistance = 700

    
    let startingLocation = CLLocation(latitude: 33.88194108771796, longitude: -117.88534289916993)
    override func viewDidLoad() {
        super.viewDidLoad()
        setStartingPosition()
        let Buildings = getBuildingLocation()
        //new
        self.mapView.delegate = self
        //end
        setAnnotation(Buildings: Buildings)
        self.tabBarItem.image = UIImage(named: "CSUF MAP")
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
            //Shops & Anemities
            Building(name: "Titan Shops (Bookstore)", lattitude: 33.881860925118076, longtitude: -117.88689858039857),
            Building(name: "Titan Student Union", lattitude: 33.88143338998001, longtitude: -117.8876066835785),
            Building(name: "Titan Gymasium", lattitude: 33.88305222266506, longtitude: -117.88613951524749),
            Building(name: "Pollak Library", lattitude: 33.881355453656326, longtitude: -117.88541531881347),
            Building(name: "Student Housing", lattitude: 33.883633, longtitude: -117.882314),
            Building(name: "Titan House", lattitude: 33.883851, longtitude: -117.884157),
            Building(name: "University Police", lattitude: 33.882996, longtitude: -117.889363),
            Building(name: "Student Health & Counseling Center", lattitude: 33.882963, longtitude: -117.884223),
            Building(name: "Student Rec Center", lattitude: 33.882957, longtitude: -117.8878),
            Building(name: "Children's Center", lattitude: 33.88605, longtitude: -117.888188),
            Building(name: "Parking & Transportation Office", lattitude: 33.884841, longtitude: -117.889424),
            
            //Food
            Building(name: "Gastronome", lattitude: 33.883108, longtitude: -117.882469),
            Building(name: "Carl's Jr.", lattitude: 33.87933799147634, longtitude: -117.8838703664209),
            Building(name: "Aloha Java", lattitude: 33.880135, longtitude: -117.884015),
            Building(name: "Brief Stop (Langsdorf Hall", lattitude: 33.879004, longtitude: -117.884611),

            //Buidlings
            Building(name: "Computer Science", lattitude: 33.88230404521395, longtitude: -117.8826660545732),
            Building(name: "Engineering", lattitude: 33.882312952126945, longtitude: -117.88322931846633),
            Building(name: "Education-Classroom", lattitude: 33.88129, longtitude: -117.884277),
            Building(name: "Ruby Gerontology Center", lattitude: 33.883597, longtitude: -117.883245),
            Building(name: "Kinesiology & Health Science", lattitude: 33.882813, longtitude: -117.885428),
            Building(name: "Humanities-Social Science", lattitude: 33.880453, longtitude: -117.88435),
            Building(name: "Clayes Performing Arts Center", lattitude: 33.88048, longtitude: -117.886729),
            Building(name: "Visual Arts", lattitude: 33.880426, longtitude: -117.888317),
            Building(name: "McCarthy Hall", lattitude: 33.879647, longtitude: -117.885699),
            Building(name: "Dan Black Hall", lattitude: 33.879135, longtitude: -117.885841),
            Building(name: "Gordon Hall (University Hall)", lattitude: 33.879651, longtitude: -117.88416),
            Building(name: "Langsdorf Hall", lattitude: 33.878997, longtitude: -117.88435),
            Building(name: "Mihaylo Hall", lattitude: 33.87867662759899, longtitude: -117.883358064499),
            Building(name: "College Park", lattitude: 33.877589, longtitude: -117.883387),
            
            //Parkings
            Building(name: "Lot G", lattitude: 33.888339, longtitude: -117.886629),
            Building(name: "Lot A", lattitude: 33.887062, longtitude: -117.889013),
            Building(name: "Lot D", lattitude: 33.884096, longtitude: -117.887807),
            Building(name: "State College Parking Structure", lattitude: 33.882399, longtitude: -117.888808),
            Building(name: "Eastside Parking Structure New", lattitude: 33.880288, longtitude: -117.881783),
            Building(name: "Eastside Parking Structure Old", lattitude: 33.880288, longtitude: -117.881791),
            Building(name: "Nutwood Parking Structure", lattitude: 33.879028, longtitude: -117.888443),
            Building(name: "Lot S", lattitude: 33.876204, longtitude: -117.883342)
        ]
        //https://www.gps-coordinates.net
        //Building(name: "Name", lattitude: , longtitude: -),
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
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if let annotation = view.annotation as? MKPointAnnotation {
            if annotation.title == "Carl's Jr." {
                
                
            }
                
            //add new views
        }
    }

    
}
