//
//  DriverEntity.swift
//  Where's my Ride?
//
//  Created by Alle,Sai Teja on 3/31/16.
//  Copyright © 2016 Alle,Sai Teja. All rights reserved.
//

import Foundation





class Driver: NSObject{
    
    
    var location:CLLocation!
    var username:String!
    var entityId: String?
    
    override init() {
        super.init()
    }
    
    init(location:CLLocation, username:String) {
        self.location = location
        self.username = username
        //self.time = time
    }
    
    
    override func hostToKinveyPropertyMapping() -> [NSObject : AnyObject]! {
        return [
            "entityId" : KCSEntityKeyId, //the required _id field
            "location" : "location",
            "username" : "username",
           // "time" : "time"
        ]
    }
    
}
