//
//  RideRequest.swift
//  Where's my Ride?
//
//  Created by Mogalipuvvu,Abhinaya Kamakshi Ammal on 4/19/16.
//  Copyright © 2016 Alle,Sai Teja. All rights reserved.
//

import Foundation

class RideRequest :NSObject {
    var pickUpLocation:String!
    var dropOffLocation:String!
    var noOfPassengers:String!
    var phone:String!
    var entityId:String?
    var requestArray:[RideRequest]!
    init(pickUp:String,dropOffLocation:String,noOfPassengers:String,phone:String){
        
        self.pickUpLocation = pickUp
        self.dropOffLocation = dropOffLocation
        self.noOfPassengers = noOfPassengers
        self.phone = phone
        
    }
    
    override init() {
        self.entityId = "1"
        self.pickUpLocation = "Horizons"
        self.dropOffLocation = "Walmart"
        self.noOfPassengers = "5"
        self.phone = "7659803456"
        self.requestArray = []
    }
    
    override func hostToKinveyPropertyMapping() -> [NSObject : AnyObject]! {
        return [
            "entityId" : KCSEntityKeyId, //the required _id field
            "pickUpLocation" : "pickUpLocation",
            "dropOffLocation" : "dropOffLocation",
            "noOfPassengers" : "noOfPassengers",
            "phone" : "phone"
        ]
    }
    
}
