//
//  Admin.swift
//  Where's my Ride?
//
//  Created by Mogalipuvvu,Abhinaya Kamakshi Ammal on 4/11/16.
//  Copyright © 2016 Alle,Sai Teja. All rights reserved.
//

import Foundation
class Admin: NSObject{
    
    
    var userName:String!
    var password :String!
    var entityId: String?
    
    override init() {
        super.init()
    }
    
    init(userName:String,password :String!) {
        self.userName = userName
        self.password = password
       
    }
    
    
    override func hostToKinveyPropertyMapping() -> [NSObject : AnyObject]! {
        return [
            "entityId" : KCSEntityKeyId, //the required _id field
            "userName" : "userName",
            "password" : "password"
            
            
        ]
    }
    
}
