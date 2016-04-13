//
//  DriverLoginViewController.swift
//  Where's my Ride?
//
//  Created by Bakshi,Ronak on 3/13/16.
//  Copyright © 2016 Alle,Sai Teja. All rights reserved.
//

import UIKit

class DriverLoginViewController: UIViewController,Operation {

    @IBOutlet weak var usernameTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
   // var activeDriver : DriverStatus!

    var kinveyObject :KinveyOperations!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Driver Login"
        
        kinveyObject = KinveyOperations(operations: self)
        //usernameTF.text = "driver1"
        //passwordTF.text = "driver1"
        
       //self.activeDriver = DriverStatus()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func ResetBTN(sender: AnyObject) {
        usernameTF.text = ""
        passwordTF.text = ""
    }
    
    
    @IBAction func loginBTN(sender: AnyObject) {
        KCSUser.loginWithUsername(usernameTF.text!,password: passwordTF.text!,withCompletionBlock:
            { (user: KCSUser!, errorOrNil: NSError!, result: KCSUserActionResult) -> Void in
                if errorOrNil == nil {
                    //the log-in was successful and the user is now the active user and credentials saved
                    //self.displayAlertControllerWithTitle("Login successful", message: "Welcome!")
                   let routesViewController:DriverRoutesViewController = self.storyboard?.instantiateViewControllerWithIdentifier("DriverRoutesViewController") as! DriverRoutesViewController
                 
                    self.navigationController?.pushViewController(routesViewController, animated: true)
                 
                    let driver :DriverStatus = DriverStatus(status: 0, user: self.usernameTF.text!)
                    print(driver)
                  self.kinveyObject.driverStatusUpdate(driver)
                    
                    
                } else {
                    //there was an error with the update save
                    let message = errorOrNil.localizedDescription
                    self.displayAlertControllerWithTitle("Login failed", message: message)
                }
            }
        )
        
        
        
    }
    //the below code is required when a new user needs to be added, also need to comment the above code
//            KCSUser.userWithUsername(
//                "kinvey",               // making up bogus data -- what you *should* use is usernameTF.text! and passwordTF.text!
//                password: "12345",
//                fieldsAndValues: [
//                    KCSUserAttributeEmail : "kinvey@kinvey.com",
//                    KCSUserAttributeGivenname : "Arnold",
//                    KCSUserAttributeSurname : "Kinvey"
//                ],
//                withCompletionBlock: { (user: KCSUser!, errorOrNil: NSError!, result: KCSUserActionResult) -> Void in
//                    if errorOrNil == nil {
//                        //was successful!
//                        self.displayAlertControllerWithTitle("Account Creation Successful", message: "User created. Welcome!")
//                    } else {
//                        //there was an error with the update save
//                        let message = errorOrNil.localizedDescription
//                        self.displayAlertControllerWithTitle("Create account failed", message: message)
//                    }
//                }
//            )
//        }
//    }
    
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayAlertControllerWithTitle(title:String, message:String) {
        let uiAlertController:UIAlertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        uiAlertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler:{(action:UIAlertAction)->Void in  }))
        self.presentViewController(uiAlertController, animated: true, completion: nil)
        
    }
    
    func onSuccess() {
       print("status updated successfully")
    }
    func onError(message: String) {
        
        
    }
    func fetchDriverData(driver: [DriverData]) {
       
    }
    

    }
