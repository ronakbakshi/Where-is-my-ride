//
//  UserMapViewController.swift
//  Where's my Ride?
//
//  Created by Alle,Sai Teja on 3/12/16.
//  Copyright © 2016 Alle,Sai Teja. All rights reserved.
//

import UIKit

class UserMapViewController: UIViewController {
    
    
    @IBOutlet weak var locationSwitch: UISwitch!
    
    
    @IBAction func userSwitchFunction(sender: AnyObject) {
        if locationSwitch.on {
            displayAlertControllerWithTitle("Location", message: "Your Location access permission is granted")
            //Write code for fetching the data to represent the user location on the map
        }
        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        self.navigationItem.title = "Navigation Map"
        displayAlertControllerWithTitle("Location", message: "Turn On Location Services to Allow Maps To Determine your Location")
    }
    
    //This fucntion displays the alert box showing the message for user  to turn on the location
    func displayAlertControllerWithTitle(title:String, message:String) {
        let uiAlertController:UIAlertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        uiAlertController.addAction(UIAlertAction(title: "OK", style:UIAlertActionStyle.Cancel, handler:{(action:UIAlertAction)->Void in  }))
        self.presentViewController(uiAlertController, animated: true, completion: nil)
        
    }
    
    
}
