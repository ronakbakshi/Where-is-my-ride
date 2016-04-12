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
    
    var driverDetails:[DriverData]!
    
   var kinveyObject :KinveyOperations!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let leftButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.Plain, target: self, action: "back:")
        leftButton.tintColor = UIColor.redColor()
        navigationItem.leftBarButtonItem  = leftButton
        kinveyObject = KinveyOperations(operations: self)
        kinveyObject.fetchingDriverDetails()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    
    func back(Any:AnyObject!){
        
        
        let destinationVC:AdminViewController = self.navigationController?.storyboard?.instantiateViewControllerWithIdentifier("AdminViewController") as! AdminViewController
        
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }
    
//    func logout(Any:AnyObject){
//        if KCSUser.activeUser() != nil {
//            KCSUser.activeUser().logout()
//            //displayAlertControllerWithTitle("Success", message:"logged out!")
//            let login =  self.navigationController?.storyboard?.instantiateViewControllerWithIdentifier("login") as! LoginViewController
//            self.navigationController?.pushViewController(login, animated: true)
//        }
//    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if driverDetails != nil {
        return driverDetails.count
        }else{
            return 0
        }

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

    
    




