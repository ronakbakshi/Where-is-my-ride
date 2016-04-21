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
    
    var driversLocation = [Driver]!()
    
    var driverAnnotation = [MapPin]()
    
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
//        
//        
//        let initialLocation = CLLocation(latitude: 48.85, longitude: 2.35)
//        
//        let regionRadius: CLLocationDistance = 5000
//        
//        let coordinateRegion = MKCoordinateRegionMakeWithDistance(initialLocation.coordinate,regionRadius * 2.0, regionRadius * 2.0)
//       
//        locationView.setRegion(coordinateRegion, animated: true)

        
        self.locationView.delegate = self
        
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
        
        self.navigationItem.title = "User Map View"
        
        let rightButton = UIBarButtonItem(title: "Request A Ride", style: UIBarButtonItemStyle.Plain, target: self, action: "nextViewController:")
        self.navigationItem.rightBarButtonItem = rightButton
        
       }
    
    func nextViewController(sender: AnyObject){
        
        
        let nvc:RideRequestViewController = self.storyboard?.instantiateViewControllerWithIdentifier("RideRequestViewController") as! RideRequestViewController
        
        self.navigationController?.pushViewController(nvc, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
        
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        
        let location = locations.last
        
        let center = CLLocationCoordinate2D(latitude: (location?.coordinate.latitude)!, longitude: (location?.coordinate.longitude)!)
        
        
        let regionRadius: CLLocationDistance = 500
        
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location!.coordinate,
            regionRadius * 2.0, regionRadius * 2.0)
        
        self.locationView.setRegion(coordinateRegion, animated: true)
        
        let circle = MKCircle(centerCoordinate: center, radius: regionRadius)
        self.locationView.addOverlay(circle)
        
        self.locationManager.stopUpdatingLocation()

        
    }
    
    func mapView(mapView: MKMapView, rendererForOverlay overlay: MKOverlay) -> MKOverlayRenderer! {
        if overlay is MKCircle {
            let circleRenderer = MKCircleRenderer(overlay: overlay)
            circleRenderer.fillColor = UIColor.redColor().colorWithAlphaComponent(0.2)
            circleRenderer.strokeColor = UIColor.yellowColor().colorWithAlphaComponent(0.7)
            circleRenderer.lineWidth = 2
            
            return circleRenderer
        }
        
        return nil
    }

    
    
    
    func driversLocations() {
//        
//        let query:KCSQuery = KCSQuery()
//        locationService.queryWithQuery(query, withCompletionBlock: { (objectsOrNil: [AnyObject]!, errorOrNil: NSError!) -> Void in
//            self.driversLocation = objectsOrNil as! [Driver]
//            
//            
//            if let _ = objectsOrNil {
//                
//                       // print(objectsOrNil)
//                for(var i=0;i<self.driversLocation.count;i++) {
//                    
//                    if (self.driversLocation[i].username != "driver1"){
//                        
//                        let driver1Center = CLLocationCoordinate2D(latitude: self.driversLocation[i].location.coordinate.latitude, longitude: self.driversLocation[i].location.coordinate.longitude)
//                        let driver1Annotation:MapPin = MapPin(coordinate: driver1Center, title: "\(self.driversLocation[i].username)Location", subtitle: "Iam here", color: "")
//                        self.driverAnnotation.append(driver1Annotation)
//                    }
//                }
//                
//                self.locationView.addAnnotations(self.driverAnnotation)
//
//            }
//            else{
//                self.displayAlertControllerWithTitle("Oops!☹️", message: "Drivers are yet to start!")
//                let driver1Coordinate = CLLocationCoordinate2DMake(40.3497,94.8806)
//                let driver1Annotation = MKPointAnnotation()
////                driver1Annotation.title =  (objectsOrNil[0].username)+" Location"
//                driver1Annotation.coordinate = driver1Coordinate
////                self.locationView.addAnnotation(driver1Annotation)
//
//            }
//            
//            }, withProgressBlock: nil)
        
        
        let query:KCSQuery = KCSQuery()
        
        locationService.queryWithQuery(query, withCompletionBlock: { (objectsOrNil: [AnyObject]!, errorOrNil: NSError!) -> Void in
            
            self.driversLocation = objectsOrNil as! [Driver]
            
            
            for(var i=0;i<self.driversLocation.count;i++) {
                
                if (self.driversLocation[i].username != "driver1"){
                    let driver1Center = CLLocationCoordinate2D(latitude: self   .driversLocation[i].location.coordinate.latitude, longitude: self.driversLocation[i].location.coordinate.longitude)
                    let driver1Annotation:MapPin = MapPin(coordinate: driver1Center, title: "\(self.driversLocation[i].username)Location", subtitle: "Iam here", color: "")
                    self.driverAnnotation.append(driver1Annotation)
                }
            }
            
            self.locationView.addAnnotations(self.driverAnnotation)
            
            
            }, withProgressBlock: nil)
        

        
        
    }
    
    func displayAlertControllerWithTitle(title:String, message:String) {
        let uiAlertController:UIAlertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        uiAlertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler:{(action:UIAlertAction)->Void in  }))
        self.presentViewController(uiAlertController, animated: true, completion: nil)
        
    }
    
    
        func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!)
            -> MKAnnotationView! {
    
                let annotationReuseId = "Place"
                var anView = mapView.dequeueReusableAnnotationViewWithIdentifier(annotationReuseId)
                if annotation is MKUserLocation {
                    anView = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationReuseId)
                    anView!.image = UIImage(named: "Marker Filled-25.png")
                    anView!.backgroundColor = UIColor.greenColor()
                    anView!.canShowCallout = true
                    
                }
                if anView == nil {
                    anView = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationReuseId)
                    anView!.image = UIImage(named: "Taxi Filled-25.png")
                    anView!.backgroundColor = UIColor.greenColor()
                    anView!.canShowCallout = true
                    
                } else {
                    anView!.annotation = annotation
                    anView!.image = UIImage(named: "Taxi Filled-25.png")
                    anView!.backgroundColor = UIColor.greenColor()
                    anView!.canShowCallout = true
                    
                }
                return anView
        }
    
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        
        print("Errors"+error.localizedDescription)
        
    }
    
    
    
}


