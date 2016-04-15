//
//  AdminOperationsViewController.swift
//  Where's my Ride?
//
//  Created by Mogalipuvvu,Abhinaya Kamakshi Ammal on 4/11/16.
//  Copyright © 2016 Alle,Sai Teja. All rights reserved.
//

import UIKit

class AdminOperationsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,Operation {

    
  @IBOutlet weak var tableView: UITableView!
    
    var driverDetails:[DriverData] = []
    
   var kinveyObject :KinveyOperations!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let leftButton = UIBarButtonItem(title: "Logout", style: UIBarButtonItemStyle.Plain, target: self, action: "logout:")
        leftButton.tintColor = UIColor.redColor()
        navigationItem.leftBarButtonItem  = leftButton
        navigationItem.backBarButtonItem  = nil
        kinveyObject = KinveyOperations(operations: self)
          tableView.reloadData()
        
        kinveyObject.fetchingDriverDetails()
    }
    
    override func viewWillAppear(animated: Bool) {
         tableView.reloadData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
 func logout(Any:AnyObject){
       if KCSUser.activeUser() != nil {
           KCSUser.activeUser().logout()
          //displayAlertControllerWithTitle("Success", message:"logged out!")
            let destinationVC:AdminViewController = self.navigationController?.storyboard?.instantiateViewControllerWithIdentifier("AdminViewController") as! AdminViewController
        self.navigationController?.pushViewController(destinationVC, animated: true)
       }   }
    
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        
//        if driverDetails != nil {
//        return driverDetails.count
//        }else{
//            return 0
//        }
        print(driverDetails.count)
        return driverDetails.count

    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
           let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
            let driverLBL:UILabel = cell.viewWithTag(100) as! UILabel
            driverLBL.text = driverDetails[indexPath.row].user
            return cell
        }
    
//    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
//        if editingStyle == UITableViewCellEditingStyle.Delete {
//            driverDetails.removeAtIndex(indexPath.row)
//            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
//        }
//    }
    
//    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
//        
//    }
    

    func onSuccess() {
        
    }
    func onError(message: String) {
        
        
    }
    func fetchDriverData(driver: [DriverData]) {
        driverDetails = driver
        print(driverDetails)
        tableView.reloadData()
    }
    
    

    }

    
    




