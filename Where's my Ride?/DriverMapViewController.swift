//
//  DriverMapViewController.swift
//  Where's my Ride?
//
//  Created by NWMSU on 3/25/16.
//  Copyright © 2016 Alle,Sai Teja. All rights reserved.
//

import UIKit
import MapKit

class DriverMapViewController: UIViewController, MKMapViewDelegate ,CLLocationManagerDelegate ,Operation{
    
    @IBOutlet weak var locationView: MKMapView!
    
 
    let locationManager = CLLocationManager()
    
  
    var kinveyObject :KinveyOperations!
    
    var myLocations: [CLLocation] = []
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.navigationItem.title = "Current Route"
        
        kinveyObject = KinveyOperations(operations: self)
        
        self.locationManager.delegate = self
        
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        self.locationManager.requestWhenInUseAuthorization()
        
        self.locationManager.startUpdatingLocation()
        
        self.locationView.showsUserLocation = true
        

    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
      
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations.last
        
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        
        let region =  MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))
        
        self.locationView.setRegion(region, animated: true)
        
        let driverName : String! = defaults.valueForKey(Constants.driver) as! String
        
        let driverLocation:Driver = Driver(location: location!, username : driverName)
        
        self.kinveyObject.updateDriverLocation(driverLocation)
        

        
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {

        print("Errors"+error.localizedDescription)
        
    }
    
    func onSuccess() {
        
    }
    func onError(message: String) {
        
        
    }
    func fetchDriverData(driver: [DriverData]) {
      
    }
    
}
