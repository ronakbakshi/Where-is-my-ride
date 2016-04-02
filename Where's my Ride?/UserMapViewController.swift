//
//  UserMapViewController.swift
//  Where's my Ride?
//
//  Created by Alle,Sai Teja on 3/12/16.
//  Copyright © 2016 Alle,Sai Teja. All rights reserved.
//

import UIKit

import MapKit

import CoreLocation


class UserMapViewController: UIViewController,MKMapViewDelegate,CLLocationManagerDelegate {
    
    @IBOutlet weak var locationView: MKMapView!
    
    var locationService:KCSAppdataStore!
    
    let locationManager = CLLocationManager()
    
    var driverLocations:[Driver]!

 
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.locationManager.delegate = self
        
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        self.locationManager.requestWhenInUseAuthorization()
        
        self.locationManager.startUpdatingLocation()
        
        self.locationView.showsUserLocation = true
        
        
        locationService = KCSAppdataStore.storeWithOptions([ // a store represents a local connection to the cloud data base
            KCSStoreKeyCollectionName : "driverLocations",
            KCSStoreKeyCollectionTemplateClass : Driver.self
            ])
        //
        driversLocations()
        
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
        
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations.last

        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))

        self.locationView.setRegion(region, animated: true)
        
    }
    
    //    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    
    //        let location = locations.last
    
    //
    
    //        let center = CLLocationCoordinate2DMake((location?.coordinate.latitude)!, (location?.coordinate.longitude)!)
    
    //
    
    //        let region = MKCoordinateRegionMake(center, MKCoordinateSpanMake(1, 1))
    
    //
    
    //
    
    //        self.mapView.setRegion(region, animated: true)
    
    //
    
    //        self.locationManager.stopUpdatingLocation()
    
    //    }
    
    
    
    func driversLocations() {
        
        //        let query:KCSQuery = KCSQuery()
        locationService.queryWithQuery(KCSQuery(), withCompletionBlock: { (objectsOrNil: [AnyObject]!, errorOrNil: NSError!) -> Void in
            for obj in objectsOrNil {
                print(obj)
            }
            self.driverLocations = objectsOrNil as! [Driver]
            let driver0Coordinate = CLLocationCoordinate2DMake(self.driverLocations[0].location!.coordinate.latitude,self.driverLocations[0].location!.coordinate.longitude)
            
            //span
            let latDelta:CLLocationDegrees = 1
            let longDelta:CLLocationDegrees = 1
            let driver0Span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
            
            
            
            let driver0Region = MKCoordinateRegion(center: driver0Coordinate, span: driver0Span)
            self.locationView.setRegion(driver0Region, animated: true)
            
            
            
            let driver0Annotation = MKPointAnnotation()
            driver0Annotation.title = "Driver1 Location"
            driver0Annotation.coordinate = driver0Coordinate
            self.locationView.addAnnotation(driver0Annotation)
            }, withProgressBlock: nil)
        
        
        
        
        //        driver0 location
        
        
        
        
        
        
        
        //
        //        let query:KCSQuery = KCSQuery(onField: "locations", usingConditional: KCSQueryConditional.KCSLessThanOrEqual,   forValue: NSNumber(double:Double(priceTF.text!)!))
        //        store.queryWithQuery(query, withCompletionBlock: { (objectsOrNil: [AnyObject]!, errorOrNil: NSError!) -> Void in
        ////            self.results = objectsOrNil as! [Lot] // store values for use in UITableViewDataSource
        ////            self.resultsTV.reloadData()
        //            },
        //            withProgressBlock: nil)
        
        
        //User Location
        //        let userLat = locationManager.location!.coordinate.latitude
        //        let userLong = locationManager.location!.coordinate.longitude
        //        let userCoordinate = CLLocationCoordinate2DMake(userLat, userLong)
        
        
        
        //        let userRegion = MKCoordinateRegion(center: userCoordinate, span: driver1Span)
        //        locationView.setRegion(userRegion, animated: true)
        //
        //        let userAnnotation = MKPointAnnotation()
        //        userAnnotation.title = "My Location"
        //        userAnnotation.coordinate = userCoordinate
        //        locationView.addAnnotation(userAnnotation)
        
        
        //        //driver1Coordinates
        //        let driver1lat:CLLocationDegrees = 40.3
        //        let driver1long:CLLocationDegrees = -94.9
        //        let driver1Coordinate = CLLocationCoordinate2D(latitude: driver1lat, longitude: driver1long)
        //
        //
        //
        //        let driver1Region = MKCoordinateRegion(center: driver1Coordinate, span: driver1Span)
        //        locationView.setRegion(driver1Region, animated: true)
        //
        //
        //
        //
        //
        //
        //
        //        //Driver2 Location
        //
        //        let driver2lat:CLLocationDegrees = 40
        //        let driver2long:CLLocationDegrees = -94.9
        //        let driver2Coordinate = CLLocationCoordinate2D(latitude: driver2lat, longitude: driver2long)
        //
        //
        //        let driver2Region = MKCoordinateRegion(center: driver2Coordinate, span: driver1Span)
        //        locationView.setRegion(driver2Region, animated: true)
        //
        //
        //
        //        let driver2Annotation = MKPointAnnotation()
        //        driver2Annotation.title = "Driver2 Location"
        //        driver2Annotation.coordinate = driver2Coordinate
        //        locationView.addAnnotation(driver2Annotation)
        //
        //
        
        
        
        
    }
    
    //        func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    //
    //            let location = locations.last
    //    
    //    
    //    
    //            let center = CLLocationCoordinate2DMake((location?.coordinate.latitude)!, (location?.coordinate.longitude)!)
    //    
    //    
    //    
    //            let region = MKCoordinateRegionMake(center, MKCoordinateSpanMake(1, 1))
    //    
    //    
    //    
    //    
    //    
    //            self.mapView.setRegion(region, animated: true)
    //    
    //    
    //    
    //            self.locationManager.stopUpdatingLocation()
    //    
    //        }
    
    

    
    
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        
        
        
        print("Errors"+error.localizedDescription)
        
    }
    
    
    
}


//import UIKit
//
//class UserMapViewController: UIViewController {
//
//
//    @IBOutlet weak var locationSwitch: UISwitch!
//
//
//
//
//    @IBAction func userSwitchFunction(sender: AnyObject) {
//        if locationSwitch.on {
//            displayAlertControllerWithTitle("Location", message: "Your Location access permission is granted")
//            //Write code for fetching the data to represent the user location on the map
//
//
//        }
//
//    }
//
//
//    override func viewWillAppear(animated: Bool) {
//        //self.navigationItem.title = "Navigation Map"
//        displayAlertControllerWithTitle("Location", message: "Turn On Location Services to Allow Maps To Determine your Location")
//    }
//
//    //This fucntion displays the alert box showing the message for user  to turn on the location
//    func displayAlertControllerWithTitle(title:String, message:String) {
//        let uiAlertController:UIAlertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
//        uiAlertController.addAction(UIAlertAction(title: "OK", style:UIAlertActionStyle.Cancel, handler:{(action:UIAlertAction)->Void in  }))
//        self.presentViewController(uiAlertController, animated: true, completion: nil)
//
//    }
//
//
//}

