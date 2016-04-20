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
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        kinveyObject = KinveyOperations(operations: self)
        self.view.addBackground()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationItem.title = "Driver Login"
        
//        let filePath = NSBundle.mainBundle().pathForResource("giphy", ofType: "gif")
//        let gif = NSData(contentsOfFile: filePath!)
//        
//        let webViewBG = UIWebView(frame: self.view.frame)
//        webViewBG.loadData(gif!, MIMEType: "image/gif", textEncodingName: String(), baseURL: NSURL())
//        webViewBG.userInteractionEnabled = false;
//        self.view.addSubview(webViewBG)
        usernameTF.text = ""
        passwordTF.text = ""
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.navigationItem.title = "Logout"
    }
    
    @IBAction func ResetBTN(sender: AnyObject) {
        usernameTF.text = ""
        passwordTF.text = ""
    }
    
    
    @IBAction func loginBTN(sender: AnyObject) {
        
        let appy = UIApplication.sharedApplication().delegate as! AppDelegate
        
        appy.name = self.usernameTF.text!
        
        KCSUser.loginWithUsername(usernameTF.text!,password: passwordTF.text!,withCompletionBlock:
            { (user: KCSUser!, errorOrNil: NSError!, result: KCSUserActionResult) -> Void in
                if errorOrNil == nil {
                   
                    let user = KCSUser.activeUser().username
                    
                    print ("from KCSUser Activer User \(user) ")
                    
                    //let driver :DriverStatus = DriverStatus(status: 0, user: self.usernameTF.text!)
                    let authorizedDriver:Driver = Driver(location:CLLocation(latitude:17.8, longitude: 40.5), username : self.usernameTF.text!)
                    
                    
                    self.kinveyObject.driverLocation(authorizedDriver)
                    
                    //self.defaults.setValue(self.usernameTF.text, forKey: Constants.driver)
                    //print(self.defaults.valueForKey(Constants.driver)!)
                    
                    self.defaults.synchronize()
                    
                    
                    //the log-in was successful and the user is now the active user and credentials saved
                    //self.displayAlertControllerWithTitle("Login successful", message: "Welcome!")
//                    let routesViewController:DriverRoutesViewController = self.storyboard?.instantiateViewControllerWithIdentifier("RideTypeTableViewController") as! DriverRoutesViewController
//                    
//                    self.navigationController?.pushViewController(routesViewController, animated: true)
                    
                    let rideTypeTableViewController:RideTypeTableViewController = self.storyboard?.instantiateViewControllerWithIdentifier("RideTypeTableViewController") as! RideTypeTableViewController
                    
                    self.navigationController?.pushViewController(rideTypeTableViewController, animated: true)
                    
                    
                } else {
                    //there was an error with the update save
                    //let message = errorOrNil.localizedDescription
                    let message = "Username/Password is invalid"
                    self.displayAlertControllerWithTitle("Login Failed", message: message)
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
