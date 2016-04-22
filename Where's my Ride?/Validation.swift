//
//  Validation.swift
//  Where's my Ride?
//
//  Created by Bakshi,Ronak on 4/21/16.
//  Copyright © 2016 Alle,Sai Teja. All rights reserved.
//

import Foundation

class Validation{
    
    static func isValidEmail(emailTF:String) -> Bool {
    
        let emailRegularExpression =  "[a-zA-Z0-9._]"
        let testForMatches = NSPredicate(format:"SELF MATCHES %@", emailRegularExpression)
        return testForMatches.evaluateWithObject(emailTF)
    }
    
    static func isValidPassword(passwordTF:String) -> Bool {
        let passwordRegularExpression = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).{6,15}$"
        let testForMatches = NSPredicate(format:"SELF MATCHES %@", passwordRegularExpression)
        return testForMatches.evaluateWithObject(passwordTF)
        
    }

    
}