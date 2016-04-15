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
    
    var kinveyObject :KinveyOperations!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        kinveyObject = KinveyOperations(operations: self)
        navigationItem.title = "Register Driver"

    }
    @IBAction func registerDriverBTN(sender: AnyObject) {
        
        let driver :DriverData = DriverData (user: driverNameTF.text!, password: driverPwdTF.text! , emailId: driverEmailTF.text!,status:false)
        kinveyObject.addDriver(driver)
//        KCSUser.userWithUsername(
//            driverNameTF.text!,
//            password: driverPwdTF.text!,
//            fieldsAndValues:[
//            KCSUserAttributeEmail : driverEmailTF.text! ,
//            ],
//            withCompletionBlock: { (user: KCSUser!, errorOrNil: NSError!, result: KCSUserActionResult) -> Void in
//                if errorOrNil == nil {
//                    //was successful!
//                    self.displayAlertControllerWithTitle("Account Creation Successful", message: "User created. Welcome!")
//                } else {
//                    //there was an error with the update save
//                    let message = errorOrNil.localizedDescription
//                    self.displayAlertControllerWithFailure("Create account failed", message: message)
//                }
//            }
//        )
//        storeDriver.saveObject(
//            driver,
//            withCompletionBlock: { (objectsOrNil: [AnyObject]!, errorOrNil: NSError!) -> Void in
//                if errorOrNil != nil {
//                    //save failed
//                    print("Save failed, with error: %@", errorOrNil.localizedFailureReason)
//                } else {
//                    //save was successful
//                    print("Successfully saved event (id='%@').", (objectsOrNil[0] as! NSObject).kinveyObjectId())
//                }
//            },
//            withProgressBlock: nil
//        )
        
        driverNameTF.text! = " "
        driverPwdTF.text! = " "
        driverEmailTF.text! = " "

    }
    func onError(message:String) {
        self.displayAlertControllerWithFailure("Create account failed", message: message)
    }
    func onSuccess() {
        self.displayAlertControllerWithTitle("Account Creation Successful", message: "User created. Welcome!")
    }
    func fetchDriverData(driver: [DriverData]) {
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
           }
    
    func displayAlertControllerWithTitle(title:String, message:String) {
        let uiAlertController:UIAlertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        uiAlertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler:{action in self.performSegueWithIdentifier("register",sender:self)}))
        self.presentViewController(uiAlertController, animated: true, completion: nil)
    }
    func displayAlertControllerWithFailure(title:String, message:String) {
        let uiAlertController:UIAlertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        uiAlertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler:{(action:UIAlertAction)->Void in  }))
        self.presentViewController(uiAlertController, animated: true, completion: nil)
        
    }
    
}
