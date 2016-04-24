//
//  Validation.swift
//  Where's my Ride?
//
//  Created by Bakshi,Ronak on 4/21/16.
//  Copyright © 2016 Alle,Sai Teja. All rights reserved.
//  Contains static functions for validating the fields in the entire app

import Foundation

class Validation{
    //Validates the email
    static func isValidEmail(emailTF:String) -> Bool {
        let emailRegularExpression =  "[a-zA-Z0-9._]"
        let testForMatches = NSPredicate(format:"SELF MATCHES %@", emailRegularExpression)
        return testForMatches.evaluateWithObject(emailTF)
    }
    //Validates the Contact number
    static func isValidContact(contactTF:String) -> Bool {
        let emailRegularExpression =  "[0-9{10,10}]"
        let testForMatches = NSPredicate(format:"SELF MATCHES %@", emailRegularExpression)
        return testForMatches.evaluateWithObject(contactTF)
    }
    //validates the number of passengers
    static func isValidPassengers(passengersTF:String) -> Bool {
        let emailRegularExpression =  "[0-9{1,2}]"
        let testForMatches = NSPredicate(format:"SELF MATCHES %@", emailRegularExpression)
        return testForMatches.evaluateWithObject(passengersTF)
    }
}