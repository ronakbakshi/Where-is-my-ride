//
//  DriverData.swift
//  Where's my Ride?
//
//  Created by Mogalipuvvu,Abhinaya Kamakshi Ammal on 4/11/16.
//  Copyright © 2016 Alle,Sai Teja. All rights reserved.
//

import Foundation

class DriverData: NSObject{

    var user:String!
    var password:String!
    var emailId:String!
    var entityId: String?
    
    override init() {
        super.init()
    }
    
    init(user:String,password:String,emailId:String) {
        self.user = user
        self.password = password
        self.emailId = emailId
        
        
    }

    override func hostToKinveyPropertyMapping() -> [NSObject : AnyObject]! {
        return [
            "entityId" : KCSEntityKeyId, //the required _id field
            "user" : "user",
            "password" : "password",
            "emailId" : "emailId"
            
        ]
    }
    
}