//
//  UserLoginViewController.swift
//  Where's my Ride?
//
//  Created by Mogalipuvvu,Abhinaya Kamakshi Ammal on 4/19/16.
//  Copyright © 2016 Alle,Sai Teja. All rights reserved.
//

import UIKit

class UserLoginViewController: UIViewController {
    
    @IBOutlet weak var useLoginTF: UITextField!
    @IBOutlet weak var userPasswordTF: UITextField!
    
    @IBAction func resetBTN(sender: AnyObject) {
        useLoginTF.text = ""
        userPasswordTF.text = ""
    }
    
    var store:KCSAppdataStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(animated: Bool) {
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        store = KCSAppdataStore.storeWithOptions([ // a store represents a local connection to the cloud data base
            KCSStoreKeyCollectionName : "RegisteredUsers",
            KCSStoreKeyCollectionTemplateClass : Driver.self
            ])
        self.navigationItem.title = "User Login"
        self.navigationItem.backBarButtonItem = nil
    }
    
    @IBAction func signInBTN(sender: AnyObject) {
        KCSUser.loginWithUsername(useLoginTF.text!,password: userPasswordTF.text!,withCompletionBlock:
            { (user: KCSUser!, errorOrNil: NSError!, result: KCSUserActionResult) -> Void in
                if errorOrNil == nil {
                    let userMapViewController:UserMapViewController = self.storyboard?.instantiateViewControllerWithIdentifier("userMapViewController") as! UserMapViewController
                    self.navigationController?.pushViewController(userMapViewController, animated: true)
                } else {
                    //there was an error with the update save
                    let message = errorOrNil.localizedDescription
                    self.displayAlertControllerWithTitle("Login failed", message: message)
                }
            }
        )
    }
    
    func displayAlertControllerWithTitle(title:String, message:String) {
        let uiAlertController:UIAlertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        uiAlertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler:{(action:UIAlertAction)->Void in  }))
        self.presentViewController(uiAlertController, animated: true, completion: nil)
    }
}
