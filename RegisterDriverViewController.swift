//
//  RegisterDriverViewController.swift
//  Where's my Ride?
//
//  Created by Mogalipuvvu,Abhinaya Kamakshi Ammal on 4/11/16.
//  Copyright © 2016 Alle,Sai Teja. All rights reserved.
//

import UIKit

class RegisterDriverViewController: UIViewController, Operation {
    
    @IBOutlet weak var driverPwdTF: UITextField!
    
    @IBOutlet weak var driverNameTF: UITextField!
    
    @IBOutlet weak var driverEmailTF: UITextField!
    
    //var storeDriver:KCSAppdataStore!
    @IBOutlet weak var driverLastNameTF: UITextField!
    
    @IBOutlet weak var driverContactTF: UITextField!
    
    var kinveyObject :KinveyOperations!
    
    var error:Bool = true
    
    @IBOutlet weak var confirmPwdTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        kinveyObject = KinveyOperations(operations: self)
        navigationItem.title = "Register Driver"
        
        //self.navigationItem.setHidesBackButton(true, animated: <#T##Bool#>)
        
    }
    
    
    
    
    @IBAction func registerDriverBTN(sender: AnyObject) {
        
        
        
        
        self.error = false
        
        if self.driverNameTF.text != "" && self.driverLastNameTF.text != "" && self.driverContactTF.text != "" && self.driverEmailTF.text != "" && self.driverPwdTF.text != "" && self.confirmPwdTF.text != "" {
            
            if !Validation.isValidEmail(driverEmailTF.text!) && !Validation.isValidContact(self.driverContactTF.text!) && driverPwdTF.text != self.confirmPwdTF.text {
                self.error = false
            }
            else{
                self.error = true
            }
            
        }else{
            self.displayAlertControllerWithFailure("Invalid data!", message: "Please check the details entered.")
        }
        if self.error{
            let driver :DriverData = DriverData(user: driverNameTF.text!, password:  driverPwdTF.text!, emailId: driverEmailTF.text!, contact: driverContactTF.text!, lastName: driverLastNameTF.text!)
            self.kinveyObject.addDriver(driver)
        }else{
            displayAlertControllerWithFailure("Registration Failed", message: "Invalid data")
        }
        
    }
    
    func clear(){
        
    }
    
    func onError(message:String) {
        self.displayAlertControllerWithFailure("Create account failed", message: message)
    }
    func onSuccess(sender:AnyObject) {
        self.displayAlertControllerWithSuccess("Account Creation Successful", message: "User created. Welcome!")
        
    }
    func fetchDriverData(driver: [DriverData]) {
        
    }
    func fetchRequests(request:[RideRequests]){
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //drawing
    //    func displayAlertControllerWithTitle(title:String, message:String) {
    //        let uiAlertController:UIAlertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
    //        uiAlertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler:{action in self.performSegueWithIdentifier("register_driverlist",sender:self)}))
    //        self.presentViewController(uiAlertController, animated: true, completion: nil)
    //    }
    //
    func displayAlertControllerWithFailure(title:String, message:String) {
        let uiAlertController:UIAlertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        uiAlertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler:{(action:UIAlertAction)->Void in  }))
        
        self.presentViewController(uiAlertController, animated: true, completion: nil)
        
    }
    
    func success(){
        self.driverNameTF.text = ""
        self.driverLastNameTF.text = ""
        self.driverContactTF.text = ""
        self.driverEmailTF.text = ""
        self.driverPwdTF.text = ""
        self.confirmPwdTF.text = ""
    }
    
    func displayAlertControllerWithSuccess(title:String, message:String) {
        let uiAlertController:UIAlertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        uiAlertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler:{(action:UIAlertAction)->Void in  }))
        success()
        self.presentViewController(uiAlertController, animated: true, completion: nil)
        
    }

    
}
