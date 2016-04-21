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
        
        
        let rightButton = UIBarButtonItem(title: "AddDriver", style: UIBarButtonItemStyle.Plain, target: self, action: "add:")
        rightButton.tintColor = UIColor.redColor()
        navigationItem.rightBarButtonItem  = rightButton
      
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
           
            let destinationVC:AdminViewController = self.navigationController?.storyboard?.instantiateViewControllerWithIdentifier("AdminViewController") as! AdminViewController
            self.navigationController?.pushViewController(destinationVC, animated: true)
        }   }
    
    func add(Any:AnyObject){
  
            let destination:RegisterDriverViewController = self.navigationController?.storyboard?.instantiateViewControllerWithIdentifier("register") as! RegisterDriverViewController
            self.navigationController?.pushViewController(destination, animated: true)
          }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        print(driverDetails.count)
        return driverDetails.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        let driverNameLBL:UILabel = cell.viewWithTag(100) as! UILabel
        let driverEmailLBL:UILabel = cell.viewWithTag(200) as! UILabel
        let driverContactLBL:UILabel = cell.viewWithTag(300) as! UILabel
        let driverImage:UIImageView = cell.viewWithTag(400) as! UIImageView
        driverNameLBL.text = driverDetails[indexPath.row].user
         driverEmailLBL.text = driverDetails[indexPath.row].emailId
        driverContactLBL.text = driverDetails[indexPath.row].contact
        driverImage.image = UIImage(named: "driver.png")
        
        return cell
    }
    
    
    func onSuccess(sender:AnyObject) {
        
    }
    func onError(message: String) {
        
        
    }
    func fetchDriverData(driver: [DriverData]) {
        driverDetails = driver as! [DriverData]
        print(driverDetails)
        tableView.reloadData()
    }
    
    func fetchRequests(request:[RideRequests]){
        
    }
    
}







