//
//  RideRequestViewController.swift
//  Where's my Ride?
//
//  Created by Mogalipuvvu,Abhinaya Kamakshi Ammal on 4/19/16.
//  Copyright © 2016 Alle,Sai Teja. All rights reserved.
//

import UIKit

class RideRequestViewController: UIViewController,Operation{
    
    
    @IBOutlet weak var contactNumberTF: UITextField!
    
    @IBOutlet weak var pickUpLocationTF: UITextField!
    

    @IBOutlet weak var dropLocationTF: UITextField!
    
    @IBOutlet weak var passengersTF: UITextField!
    
    
    var  kinveyObject :KinveyOperations!
    
     var store:KCSAppdataStore!
    
    var request:RideRequests!
    
    var pickupArray:[RideRequests]!
    
    
   
    override func viewDidLoad() {
        
        super.viewDidLoad()

        pickupArray = []
        
        self.kinveyObject = KinveyOperations(operations: self)
        
        store = KCSAppdataStore.storeWithOptions([
            KCSStoreKeyCollectionName : "RideRequests",
            KCSStoreKeyCollectionTemplateClass : RideRequests.self
            ])
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationItem.title = "Request A Ride"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func submitBTN(sender: AnyObject) {
        
        
        
         request = RideRequests(pickUp: pickUpLocationTF.text!, dropOffLocation: dropLocationTF.text!,noOfPassengers: passengersTF.text!, phone: contactNumberTF.text!)
       
      
            store.saveObject(
                
                request,
                
                withCompletionBlock: { (objectsOrNil: [AnyObject]!, errorOrNil: NSError!) -> Void in
                    if errorOrNil != nil {
                        //save failed
                        print("Save failed, with error: %@", errorOrNil.localizedFailureReason)
                    } else {
                        
                        print("Successfully saved Pickup Details (id='%@').", (objectsOrNil[0] as! NSObject).kinveyObjectId())
                        self.displayAlertControllerWithTitle("Success!!!", message: "Pickup details are updated")
                    }
                },
                
                withProgressBlock: nil
            )
            
            
        }
    
    
    func displayAlertControllerWithTitle(title:String, message:String) {
        let uiAlertController:UIAlertController = UIAlertController(title: title,
            message: message, preferredStyle: UIAlertControllerStyle.Alert)
        uiAlertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel,
            handler:  nil))
        self.presentViewController(uiAlertController, animated: true, completion: nil)
        
        
        
        
    }
    
    func onSuccess(sender:AnyObject) {
        
        self.pickupArray = sender as! [RideRequests]
        
    }
    func onError(message: String) {
        
        
    }
    func fetchDriverData(driver: [DriverData]) {
        
    }
    
    func fetchRequests(request:[RideRequests]){
        
    }
        
  

}
