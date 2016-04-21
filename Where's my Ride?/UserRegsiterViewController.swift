//
//  UserRegsiterViewController.swift
//  Where's my Ride?
//
//  Created by Mogalipuvvu,Abhinaya Kamakshi Ammal on 4/19/16.
//  Copyright © 2016 Alle,Sai Teja. All rights reserved.
//

import UIKit

class UserRegsiterViewController: UIViewController {


    
    @IBOutlet weak var userNameTF: UITextField!
    
    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var contactTF: UITextField!
    
    @IBOutlet weak var placeTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    var store : KCSAppdataStore!
    
//    let contactRegex = "[0-9]"
//    let emailTest = NSPredicate(format:"SELF MATCHES %@", contactRegex)
//    let result = emailTest.evaluateWithObject(emailTF.text)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        store = KCSAppdataStore.storeWithOptions([ // a store represents a local connection to the cloud data base
            KCSStoreKeyCollectionName : "RegisteredUser",
            KCSStoreKeyCollectionTemplateClass : Driver.self
            ])
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationItem.title = "Sign Up"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func registerUserBTN(sender: AnyObject) {
        let user :UserDetails = UserDetails(username: userNameTF.text!, password: passwordTF.text!)
        KCSUser.userWithUsername(
            userNameTF.text!,
            password: passwordTF.text!,
            fieldsAndValues: nil,
            withCompletionBlock: { (user: KCSUser!, errorOrNil: NSError!, result: KCSUserActionResult) -> Void in
                if errorOrNil == nil {
                    //was successful!
                    if self.userNameTF.text != "" && self.firstNameTF.text != "" && self.lastNameTF.text != "" && self.contactTF.text != "" && self.placeTF.text != "self." && self.passwordTF.text != ""{
                        
                        
                        self.displayAlertControllerWithTitle("Account Creation Successful", message: "User created. Welcome!")
                        let destinationVC:UserLoginViewController = self.navigationController?.storyboard?.instantiateViewControllerWithIdentifier("UserLoginViewController") as! UserLoginViewController
                        self.navigationController?.pushViewController(destinationVC, animated: true)
                    }else{
                        //let message = errorOrNil.localizedDescription
                        self.displayAlertControllerWithTitle("Create account failed", message: "Please enter all the fields")
                    }
                    
                } else {
                    //there was an error with the update save
                    let message = errorOrNil.localizedDescription
                    self.displayAlertControllerWithTitle("Create account failed", message: message)
                }
            }
        )
        
        store.saveObject(
            user,
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
        
    }
    
    func displayAlertControllerWithTitle(title:String, message:String) {
        let uiAlertController:UIAlertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        uiAlertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler:{(action:UIAlertAction)->Void in  }))
        self.presentViewController(uiAlertController, animated: true, completion: nil)
        
    }
    
    
}
