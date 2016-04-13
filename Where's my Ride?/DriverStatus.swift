//
//  DriverStatus.swift
//  Where's my Ride?
//
//  Created by Mogalipuvvu,Abhinaya Kamakshi Ammal on 4/12/16.
//  Copyright © 2016 Alle,Sai Teja. All rights reserved.
//

import Foundation

class DriverStatus: NSObject{
    
    
    
    var user:String!
    var status : NSNumber!
    var entityId: String?
    
    override init() {
        super.init()
    }
    
    init(status:NSNumber!, user:String) {
        self.status = status
        self.user = user
       
    }
    
    
    override func hostToKinveyPropertyMapping() -> [NSObject : AnyObject]! {
        return [
            "entityId" : KCSEntityKeyId, //the required _id field
            "user" : "user",
            "status" : "status",
            
            
        ]
    }
    
}
