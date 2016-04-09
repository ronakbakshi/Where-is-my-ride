//
//  DriverEntity.swift
//  Where's my Ride?
//
//  Created by Alle,Sai Teja on 3/31/16.
//  Copyright © 2016 Alle,Sai Teja. All rights reserved.
//

import Foundation


import Foundation


class Driver: NSObject{
    
    
    var location:CLLocation!
    var user:String!
    var entityId: String?
    
    override init() {
        super.init()
    }
    
    init(location:CLLocation, user:String) {
        self.location = location
        self.user = user
    }
    
    
    override func hostToKinveyPropertyMapping() -> [NSObject : AnyObject]! {
        return [
            "entityId" : KCSEntityKeyId, //the required _id field
            "location" : "location",
            "user" : "user",
            
        ]
    }
    
}
