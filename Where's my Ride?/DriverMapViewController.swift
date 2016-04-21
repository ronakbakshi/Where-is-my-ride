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
    
    var locationService:KCSAppdataStore!
    
    var kinveyObject :KinveyOperations!
    
    var previousLocation:CLLocation = CLLocation(latitude: 0.0, longitude: 0.0)
    
    var driversLocation = [Driver]!()
    
    var driverAnnotation = [MKPointAnnotation]!()
//    var anotation = MKPointAnnotation()
//    anotation.coordinate = previousLocation
//    anotation.title = "The Location"
//    anotation.subtitle = "This is the location !!!"
//    myMap.addAnnotation(anotation)
//    driverAnnotation[0] = demoAnnotation
//    
    //let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.navigationItem.title = "Current Route"
        
        kinveyObject = KinveyOperations(operations: self)
        
        self.locationManager.delegate = self
        
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        self.locationManager.requestWhenInUseAuthorization()
        
        self.locationManager.startUpdatingLocation()
        
        self.locationView.showsUserLocation = true
        
        locationService = KCSAppdataStore.storeWithOptions([ // a store represents a local connection to the cloud data base
            KCSStoreKeyCollectionName : "DriversLocation",
            KCSStoreKeyCollectionTemplateClass : Driver.self
            ])
        
        self.driverLocation()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
 
        let location = locations.last
        
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        
//        let region =  MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))
//        
//        self.locationView.setRegion(region, animated: true)
        
        let userAnnotation = MKPointAnnotation()
        
        userAnnotation.title = "My Location"
        
        userAnnotation.coordinate = center
        
        self.locationView.addAnnotation(userAnnotation)
//        if previousLocation.coordinate.latitude == 0.0 &&  previousLocation.coordinate.longitude == 0.0 {
//            
//            print("initial location \(previousLocation)")
//            
//            previousLocation = locations.last!
//            
//          print("updated previous location second time\(previousLocation)")   // current location
//        }
//        else {
//            
//            let location = CLLocation(latitude: 48.85, longitude: 2.35) // assuming driver change to this location
//            
//            let distance = location.distanceFromLocation(previousLocation)
//            
//            print("distance between \(distance)")
//            
//            if distance == 0 {
//                
//                self.locationManager.stopUpdatingLocation()
//            }
//            
//            else {
//                let location = locations.last
//                
//                //let timeUpdated = location?.timestamp
//                
//                //print("time captured \(timeUpdated)")
//                
//                let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
//                
//                let region =  MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))
//                
//                self.locationView.setRegion(region, animated: true)
//                
//                //let driverName : String = defaults.valueForKey(Constants.driver)! as! String
//                
//                let appy = UIApplication.sharedApplication().delegate as! AppDelegate
//                
//                
//                
//                print("Value of app delegate object \(appy.name) ")
//                
//                let driverLocation:Driver = Driver(location: location!, username : appy.name )
//                
//                print(driverLocation)
//                
//                self.kinveyObject.updateDriverLocation(driverLocation)
//                
//            }
        
//            }
        
        
        
        
    }
    
    func driverLocation(){
        
        
        let query:KCSQuery = KCSQuery()
        
        locationService.queryWithQuery(query, withCompletionBlock: { (objectsOrNil: [AnyObject]!, errorOrNil: NSError!) -> Void in
            
            self.driversLocation = objectsOrNil as! [Driver]
            
//            if let _ = objectsOrNil {
//                
//                
//                // print(objectsOrNil)
//                for var i=0;i<objectsOrNil.count;i++ {
//                    let driver1Coordinate = CLLocationCoordinate2DMake(objectsOrNil[i].location!!.coordinate.latitude,objectsOrNil[i].location!!.coordinate.longitude)
//                    let driver1Annotation = MKPointAnnotation()
//                    driver1Annotation.title =  (objectsOrNil[i].username)+" Location"
//                    driver1Annotation.coordinate = driver1Coordinate
//                    self.locationView.addAnnotation(driver1Annotation)
//                    
//                }
//            }
            for(var i=0;i<self.driversLocation.count;i++) {
                if(self.driversLocation[i].username == "driver1"){
                    let driver1Center = CLLocationCoordinate2D(latitude: self.driversLocation[i].location.coordinate.latitude, longitude: self.driversLocation[i].location.coordinate.longitude)
                    let driver1Annotation = MKPointAnnotation()
                    driver1Annotation.title = "driver1Location"
                    driver1Annotation.coordinate = driver1Center
//                    self.driverAnnotation.append(driver1Annotation)
                    self.driverAnnotation[i] = driver1Annotation
                }else if(self.driversLocation[i].username == "driver2") {
                    let driver2Center = CLLocationCoordinate2D(latitude: self.driversLocation[i].location.coordinate.latitude, longitude: self.driversLocation[i].location.coordinate.longitude)
                    let driver2Annotation = MKPointAnnotation()
                    driver2Annotation.title = "driver2Location"
                    driver2Annotation.coordinate = driver2Center
//                    self.driverAnnotation[i] = driver2Annotation
                    self.driverAnnotation.append(driver2Annotation)
                }else if(self.driversLocation[i].username == "driver3") {
                    let driver3Center = CLLocationCoordinate2D(latitude: self.driversLocation[i].location.coordinate.latitude, longitude: self.driversLocation[i].location.coordinate.longitude)
                    let driver3Annotation = MKPointAnnotation()
                    driver3Annotation.title = "driver3Location"
                    driver3Annotation.coordinate = driver3Center
                    self.driverAnnotation[i] = driver3Annotation
//                    self.driverAnnotation.append(driver3Annotation)
                }else if(self.driversLocation[i].username == "driver4") {
                    let driver4Center = CLLocationCoordinate2D(latitude: self.driversLocation[i].location.coordinate.latitude, longitude: self.driversLocation[i].location.coordinate.longitude)
                    let driver4Annotation = MKPointAnnotation()
                    driver4Annotation.title = "driver4Location"
                    driver4Annotation.coordinate = driver4Center
                    self.driverAnnotation[i] = driver4Annotation
//                    self.driverAnnotation.append(driver4Annotation)
                    
                }
            }
            self.locationView.addAnnotations(self.driverAnnotation)

            
            }, withProgressBlock: nil)

        
//        kinveyObject.fetchingDriverDetails()
//
//        
//        
//        for(var i=0;i<driversLocation.count;i++) {
//            if(driversLocation[i].username == "driver1"){
//                let driver1Center = CLLocationCoordinate2D(latitude: driversLocation[i].location.coordinate.latitude, longitude: driversLocation[i].location.coordinate.longitude)
//                let driverAnnotation = MKPointAnnotation()
//                driverAnnotation.title = "driverLocation"
//                driverAnnotation.coordinate = driver1Center
//                self.locationView.addAnnotation(driverAnnotation)
//            }else if(driversLocation[i].username == "driver2") {
//                let driver1Center = CLLocationCoordinate2D(latitude: driversLocation[i].location.coordinate.latitude, longitude: driversLocation[i].location.coordinate.longitude)
//                let driverAnnotation = MKPointAnnotation()
//                driverAnnotation.title = "driverLocation"
//                driverAnnotation.coordinate = driver1Center
//                self.locationView.addAnnotation(driverAnnotation)
//            }else if(driversLocation[i].username == "driver3") {
//                let driver1Center = CLLocationCoordinate2D(latitude: driversLocation[i].location.coordinate.latitude, longitude: driversLocation[i].location.coordinate.longitude)
//                let driverAnnotation = MKPointAnnotation()
//                driverAnnotation.title = "driverLocation"
//                driverAnnotation.coordinate = driver1Center
//                self.locationView.addAnnotation(driverAnnotation)
//            }else if(driversLocation[i].username == "driver4") {
//                let driver1Center = CLLocationCoordinate2D(latitude: driversLocation[i].location.coordinate.latitude, longitude: driversLocation[i].location.coordinate.longitude)
//                let driverAnnotation = MKPointAnnotation()
//                driverAnnotation.title = "driverLocation"
//                driverAnnotation.coordinate = driver1Center
//                self.locationView.addAnnotation(driverAnnotation)
//
//            }
//        }
//        
//        let driver1Center = CLLocationCoordinate2D(latitude: 40.3461017, longitude: -94.8724706)
//        let driverAnnotation = MKPointAnnotation()
//        driverAnnotation.title = "driverLocation"
//        driverAnnotation.coordinate = driver1Center
//        self.locationView.addAnnotation(driverAnnotation)
//        
//        let driver2Center = CLLocationCoordinate2D(latitude: 40.3461017, longitude: -94.8724706)
//        let driver2Annotation = MKPointAnnotation()
//        driver2Annotation.title = "driverLocation"
//        driver2Annotation.coordinate = driver2Center
//        self.locationView.addAnnotation(driver2Annotation)
//        
//        
//        let driver3Center = CLLocationCoordinate2D(latitude: 40.3457399, longitude: -94.8729789)
//        let driver3Annotation = MKPointAnnotation()
//        driver3Annotation.title = "driverLocation"
//        driver3Annotation.coordinate = driver3Center
//        self.locationView.addAnnotation(driver3Annotation)
        
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation)
        -> MKAnnotationView? {
            
            var pinView:MKPinAnnotationView! =
            mapView.dequeueReusableAnnotationViewWithIdentifier("pin") as! MKPinAnnotationView!
            
            if pinView == nil {
                
                pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "pin")
                pinView.pinTintColor = UIColor.greenColor()
                
            }
            return pinView
            
    }

    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        
        print("Errors"+error.localizedDescription)
        
    }
    
    func onSuccess(sender:AnyObject) {
        
    }
    func onError(message: String) {
        
        
    }
    func fetchDriverData(driver: [DriverData]) {
        
    }
    func fetchRequests(request:[RideRequests]){
        
    }
}
