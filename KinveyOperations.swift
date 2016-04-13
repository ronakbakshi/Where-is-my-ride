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
    func onSuccess()
    func onError(message:String)
    func fetchDriverData(driver:[DriverData])
    
}

class KinveyOperations {
    
     var storeDriver:KCSAppdataStore!
    var storeDriverStatus:KCSAppdataStore!
    var operationDelegate:Operation!
    
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
    }
    
    func addDriver(driver:DriverData) {
        
        KCSUser.userWithUsername(
            driver.user,
            password:driver.password,
            fieldsAndValues:[
                KCSUserAttributeEmail : driver.emailId ,
                status : driver.status ,
            ],
            withCompletionBlock: { (user: KCSUser!, errorOrNil: NSError!, result: KCSUserActionResult) -> Void in
                if errorOrNil == nil {
                    //was successful!
                    //self.displayAlertControllerWithTitle("Account Creation Successful", message: "User created. Welcome!")
                    self.operationDelegate.onSuccess()
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
                    print("Save failed, with error: %@", errorOrNil.localizedFailureReason)
                } else {
                    //save was successful
                    print("Successfully saved event (id='%@').", (objectsOrNil[0] as! NSObject).kinveyObjectId())
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

}