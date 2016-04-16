//
//  AdminViewController.swift
//  Where's my Ride?
//
//  Created by Mogalipuvvu,Abhinaya Kamakshi Ammal on 4/11/16.
//  Copyright © 2016 Alle,Sai Teja. All rights reserved.
//

import UIKit

class AdminViewController: UIViewController {

    @IBOutlet weak var adminUserNameTF: UITextField!
    
    @IBOutlet weak var adminPwdTF: UITextField!
    
    var store1:KCSAppdataStore!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        store1 = KCSAppdataStore.storeWithOptions([ // a store represents a local connection to the cloud data base
            KCSStoreKeyCollectionName : "Admin",
            KCSStoreKeyCollectionTemplateClass : Driver.self
            ])
        
        self.navigationItem.title = "Admin Login"
        self.navigationItem.backBarButtonItem = nil
       
    }

    @IBAction func adminRegisterBTN(sender: AnyObject) {
       let admin:Admin=Admin(userName: adminUserNameTF.text! ,password:adminPwdTF.text!)
        
         KCSUser.userWithUsername(
             adminUserNameTF.text!,
            password: adminPwdTF.text!,
            fieldsAndValues: nil,
                withCompletionBlock: { (user: KCSUser!, errorOrNil: NSError!, result: KCSUserActionResult) -> Void in
                    if errorOrNil == nil {
                        //was successful!
                        self.displayAlertControllerWithTitle("Account Creation Successful", message: "User created. Welcome!")
                    } else {
                        //there was an error with the update save
                        let message = errorOrNil.localizedDescription
                        self.displayAlertControllerWithTitle("Create account failed", message: message)
                    }
                }
            )
        
        store1.saveObject(
                  admin,
                    withCompletionBlock: { (objectsOrNil: [AnyObject]!, errorOrNil: NSError!) -> Void in
                       if errorOrNil != nil {
                           //save failed
                           print("Save failed, with error: %@", errorOrNil.localizedFailureReason)
                       } else {
                           //save was successful
                           print("Successfully saved event (id='%@').", (objectsOrNil[0] as! NSObject).kinveyObjectId())
                       }
                   },
                    withProgressBlock: nil
                )
        
        adminUserNameTF.text! = " "
        adminPwdTF.text! = " "

        }
 
    
    @IBAction func adminLoginBTN(sender: AnyObject) {
  
        KCSUser.loginWithUsername(adminUserNameTF.text!,password: adminPwdTF.text!,withCompletionBlock:
            { (user: KCSUser!, errorOrNil: NSError!, result: KCSUserActionResult) -> Void in
                if errorOrNil == nil {
                    //the log-in was successful and the user is now the active user and credentials saved
                    self.displayAlertControllerWithTitle("Login successful", message: "Welcome!")
//                 let destinationVC:AdminOperationsViewController = self.storyboard?.instantiateViewControllerWithIdentifier("admin_Driver") as! AdminOperationsViewController
//                    self.navigationController?.pushViewController(destinationVC, animated: true)
                    print("success")
                } else {
                    //there was an error with the update save
                    let message = errorOrNil.localizedDescription
                    self.displayAlertControllerWithTitle("Login failed", message: message)
                }
            }
        )
    }
    
    @IBOutlet weak var resetBTN: UIButton!
    
    
    @IBAction func resetBTNaction(sender: AnyObject) {
        adminUserNameTF.text = ""
        adminPwdTF.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayAlertControllerWithTitle(title:String, message:String) {
        let uiAlertController:UIAlertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        
        uiAlertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel,handler:{action in self.performSegueWithIdentifier("admin_Driver",sender:self)}))
        self.presentViewController(uiAlertController, animated: true, completion: nil)
        //self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    

}
