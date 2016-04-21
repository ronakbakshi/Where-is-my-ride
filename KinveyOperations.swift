//
//  KinveyOperations.swift
//  Where's my Ride?
//
//  Created by Mogalipuvvu,Abhinaya Kamakshi Ammal on 4/11/16.
//  Copyright © 2016 Alle,Sai Teja. All rights reserved.
//

import Foundation
import UIKit



@objc protocol Operation{
    func onSuccess(sender:AnyObject)
    func onError(message:String)
    func fetchDriverData(driver:[DriverData])
    func fetchRequests(request:[RideRequests])
    
}

class KinveyOperations {
    
    var storeDriver:KCSAppdataStore!
    var storeDriverStatus:KCSAppdataStore!
    var storeLocation:KCSAppdataStore!
    var storeRequests:KCSAppdataStore!
    var operationDelegate:Operation!
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    init(operations:Operation)
    {
        self.operationDelegate = operations
        
        storeDriver = KCSAppdataStore.storeWithOptions([ // a store represents a local connection to the cloud data base
            KCSStoreKeyCollectionName : "RegisteredDrivers",
            KCSStoreKeyCollectionTemplateClass : DriverData.self
            ])
        
        storeDriverStatus = KCSAppdataStore.storeWithOptions([ // a store represents a local connection to the cloud data base
            KCSStoreKeyCollectionName : "DriverStatus",
            KCSStoreKeyCollectionTemplateClass : DriverData.self
            ])
        
        storeLocation = KCSAppdataStore.storeWithOptions([ // a store represents a local connection to the cloud data base
            KCSStoreKeyCollectionName : "DriversLocation",
            KCSStoreKeyCollectionTemplateClass : Driver.self
    
            ])
        storeRequests = KCSAppdataStore.storeWithOptions([ // a store represents a local connection to the cloud data base
            KCSStoreKeyCollectionName : "RideRequests",
            KCSStoreKeyCollectionTemplateClass : RideRequests.self
            ])
        
    }
    //For adding commit
    
    
    
    func retrieveData() {
        print("inretrieve data")
        let query = KCSQuery()
        print(query.description)
        storeRequests.queryWithQuery(
            query,
            withCompletionBlock: { (objectsOrNil: [AnyObject]!, errorOrNil: NSError!) -> Void in
                
                if errorOrNil == nil {
                    print("fetching")
                    //print(objectsOrNil[0])
                     let ride = objectsOrNil as! [RideRequests]
                    
                    print("requests in table list \(ride)")
        
                        self.operationDelegate.fetchRequests(ride)
                    
                    
                }
                else{
                    print(errorOrNil.description)
                }
                
            },
            withProgressBlock: nil
        )
        
    }
    
    
    func addDriver(driver:DriverData) {
        
        KCSUser.userWithUsername(
            driver.user,
            password:driver.password,
            fieldsAndValues:[
                KCSUserAttributeEmail : driver.emailId ,
                //status : driver.status ,
            ],
            withCompletionBlock: { (user: KCSUser!, errorOrNil: NSError!, result: KCSUserActionResult) -> Void in
                if errorOrNil == nil {
                    //was successful!
                    //self.displayAlertControllerWithTitle("Account Creation Successful", message: "User created. Welcome!")
                    self.operationDelegate.onSuccess(driver)
                } else {
                    //there was an error with the update save
                    let message = errorOrNil.localizedDescription
                    //self.displayAlertControllerWithFailure("Create account failed", message: message)
                    self.operationDelegate.onError(message)
                }
            }
        )
        storeDriver.saveObject(
            driver,
            withCompletionBlock: { (objectsOrNil: [AnyObject]!, errorOrNil: NSError!) -> Void in
                if errorOrNil != nil {
                    //save failed
                    print("Save failed in register driver, with error: %@", errorOrNil.localizedFailureReason)
                } else {
                    //save was successful
                    print("Successfully saved in register driver (id='%@').", (objectsOrNil[0] as! NSObject).kinveyObjectId())
                }
            },
            withProgressBlock: nil
        )
    }
    
    func fetchingDriverDetails() {
        
        let query = KCSQuery()
        print(query)
        storeDriver.queryWithQuery(query, withCompletionBlock: { (objectsOrNil: [AnyObject]!, errorOrNil: NSError!) -> Void in
            if errorOrNil != nil {
                //save failed
                print("Fetching Failed: %@", errorOrNil.localizedFailureReason)
            }
            else {
                
                let driverDetails = objectsOrNil as! [DriverData]
                
                
                print("Successfully (id='%@').", (objectsOrNil[0] as! NSObject).kinveyObjectId())
                print(driverDetails)
                self.operationDelegate.fetchDriverData(driverDetails)
            }
            
            }, withProgressBlock: nil)
        
        
    }
    
    func driverStatusUpdate (driver:DriverStatus) {
        storeDriverStatus.saveObject(
            driver,
            withCompletionBlock: { (objectsOrNil: [AnyObject]!, errorOrNil: NSError!) -> Void in
                if errorOrNil != nil {
                    //save failed
                    print("Save failed, with error: %@", errorOrNil.localizedFailureReason)
                } else {
                    //save was successful
                    print("Successfully saved event (id='%@').", (objectsOrNil[0] as! NSObject).kinveyObjectId())
                }
            },
            withProgressBlock: nil )
        
    }
    
    
    func driverLocation (driver:Driver) {
        storeLocation.saveObject(
            driver,
            withCompletionBlock: { (objectsOrNil: [AnyObject]!, errorOrNil: NSError!) -> Void in
                if errorOrNil != nil {
                    //save failed
                    print("Save failed, with error: %@", errorOrNil.localizedFailureReason)
                } else {
                    //save was successful
                    print("Successfully saved event (id='%@').", (objectsOrNil[0] as! NSObject).kinveyObjectId())
                }
            },
            withProgressBlock: nil )
        
    }
    
    
    
    
    func updateDriverLocation(driver:Driver)
    {
        var driverLocation:[Driver]!
        
        let userValue = driver.username
        
        print(userValue)
        
        let query = KCSQuery(onField: "username", withExactMatchForValue: userValue)
        
        storeLocation.queryWithQuery(query, withCompletionBlock: { (objectsOrNil: [AnyObject]!, errorOrNil: NSError!) -> Void in
            
            if errorOrNil != nil {
                
                //save failed
                
                print("Update failed, with error: %@", errorOrNil.localizedFailureReason)
                
            } else {
                
                print(objectsOrNil.count)
                
                driverLocation = objectsOrNil as! [Driver]
                
                print("driver data to be update\(driverLocation)")
                
                self.deleteExistingLocation(driverLocation)
                
                
                print("Successfully updated new location (id='%@').", (objectsOrNil[0] as! NSObject).kinveyObjectId())
            }
            
            
            }, withProgressBlock: nil)
        
        
        
        
        storeLocation.saveObject(
            driver,
            withCompletionBlock: { (objectsOrNil: [AnyObject]!, errorOrNil: NSError!) -> Void in
                if errorOrNil != nil {
                    //save failed
                    print("Update failed, with error: %@", errorOrNil.localizedFailureReason)
                } else {
                    //save was successful
                    print("Successfully updated new location (id='%@').", (objectsOrNil[0] as! NSObject).kinveyObjectId())
                }            },
            withProgressBlock: nil)
    }
    
    
    func deleteExistingLocation(driverLocation:[Driver])
    {
        storeLocation.removeObject(
            
            driverLocation,
            withDeletionBlock: { (deletionDictOrNil: [NSObject : AnyObject]!, errorOrNil: NSError!) -> Void in
                if errorOrNil != nil {
                    print("Delete object Failed")
                    
                } else {
                    print("driver location deleted successfully")
                    
                }
            },
            withProgressBlock: nil
        )
    }
    
}