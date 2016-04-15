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
            KCSStoreKeyCollectionName : "DriversLocation",
            KCSStoreKeyCollectionTemplateClass : Driver.self
            ])
        self.driversLocations()
        
        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        self.driversLocations()
        
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
        
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations.last
        
        let center = CLLocationCoordinate2D(latitude: (location?.coordinate.latitude)!, longitude: (location?.coordinate.longitude)!)
        
        let region =  MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        self.locationView.setRegion(region, animated: true)
        
        let userAnnotation = MKPointAnnotation()
        
        userAnnotation.title = "My Location"
        
        userAnnotation.coordinate = center
        
        self.locationView.addAnnotation(userAnnotation)
        
    }
    
    
    
    func driversLocations() {
        
        let query:KCSQuery = KCSQuery()
        locationService.queryWithQuery(query, withCompletionBlock: { (objectsOrNil: [AnyObject]!, errorOrNil: NSError!) -> Void in
            
            if let _ = objectsOrNil {
                
                
                // print(objectsOrNil)
                for var i=0;i<objectsOrNil.count;i++ {
                    let driver1Coordinate = CLLocationCoordinate2DMake(objectsOrNil[i].location!!.coordinate.latitude,objectsOrNil[i].location!!.coordinate.longitude)
                    let driver1Annotation = MKPointAnnotation()
                    driver1Annotation.title =  (objectsOrNil[i].username)+" Location"
                    driver1Annotation.coordinate = driver1Coordinate
                    self.locationView.addAnnotation(driver1Annotation)
                    
                }
            }
            else{
                self.displayAlertControllerWithTitle("Oops!☹️", message: "Drivers are yet to start!")
                let driver1Coordinate = CLLocationCoordinate2DMake(40.3497,94.8806)
                let driver1Annotation = MKPointAnnotation()
//                driver1Annotation.title =  (objectsOrNil[0].username)+" Location"
                driver1Annotation.coordinate = driver1Coordinate
//                self.locationView.addAnnotation(driver1Annotation)

            }
            
            }, withProgressBlock: nil)
        
        
    }
    
    func displayAlertControllerWithTitle(title:String, message:String) {
        let uiAlertController:UIAlertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        uiAlertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler:{(action:UIAlertAction)->Void in  }))
        self.presentViewController(uiAlertController, animated: true, completion: nil)
        
    }
    
    //
    //    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!)
    //        -> MKAnnotationView! {
    //
    //            var pinView:MKPinAnnotationView! =
    //            mapView.dequeueReusableAnnotationViewWithIdentifier("pin") as! MKPinAnnotationView!
    //
    //            if pinView == nil {
    //
    //                pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "pin")
    //                pinView.pinTintColor = UIColor.greenColor()
    //
    //            }
    //            return pinView
    //
    //    }
    //
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        
        print("Errors"+error.localizedDescription)
        
    }
    
    
    
}


