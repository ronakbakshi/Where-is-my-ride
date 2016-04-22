//
//  NightRideViewController.swift
//  Where's my Ride?
//
//  Created by Bakshi,Ronak on 4/19/16.
//  Copyright © 2016 Alle,Sai Teja. All rights reserved.
//

import UIKit

class NightRideViewController: UIViewController, UITableViewDataSource,UITableViewDelegate, Operation {
    
    var kinveyOp:KinveyOperations!
    
    var requestList:[RideRequests] = []
    
    var storeRequests:KCSAppdataStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Night Ride View Controller"
       
        kinveyOp = KinveyOperations(operations: self)
        kinveyOp.retrieveData()
        storeRequests = KCSAppdataStore.storeWithOptions([ // a store represents a local connection to the cloud data base
            KCSStoreKeyCollectionName : "RideRequests",
            KCSStoreKeyCollectionTemplateClass : RideRequests.self
            ])

    }
    
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print(requestList.count)
        return requestList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("nightRideCell", forIndexPath: indexPath)
        let label1:UILabel = cell.viewWithTag(101) as! UILabel
        let label2:UILabel = cell.viewWithTag(102) as! UILabel
        let label3:UILabel = cell.viewWithTag(103) as! UILabel
        let label4:UILabel = cell.viewWithTag(104) as! UILabel
        let label5:UILabel = cell.viewWithTag(105) as! UILabel
        label1.text = indexPath.row.description
        label2.text = requestList[indexPath.row].pickUpLocation as String
        label4.text = requestList[indexPath.row].noOfPassengers as String
        label3.text = requestList[indexPath.row].dropOffLocation as String
        label5.text = requestList[indexPath.row].phone as String
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        return cell
    }
    
    
    @IBAction func deleteRow(sender: AnyObject) {
        
        var rowNumber = (tableView.indexPathForSelectedRow?.row)!
        storeRequests.removeObject(
            
            requestList[rowNumber],
            withDeletionBlock: { (deletionDictOrNil: [NSObject : AnyObject]!, errorOrNil: NSError!) -> Void in
                if errorOrNil != nil {
                    print("Delete object Failed")
                    
                } else {
                    print("driver location deleted successfully")
                    
                }
            },
            withProgressBlock: nil
        )
        tableView.reloadData()

        
    }
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        storeRequests.removeObject(
//            
//            requestList[indexPath.row],
//            withDeletionBlock: { (deletionDictOrNil: [NSObject : AnyObject]!, errorOrNil: NSError!) -> Void in
//                if errorOrNil != nil {
//                    print("Delete object Failed")
//                    
//                } else {
//                    print("driver location deleted successfully")
//                    
//                }
//            },
//            withProgressBlock: nil
//        )
//
//    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func onSuccess(sender:AnyObject) {
        //self.pickupArray = sender as! [RideRequests]
    }
    func onError(message: String) {
        
        
    }
    func fetchRequests(request:[RideRequests]) {
        requestList = request
        print("fetchrequest \(request)")
        self.tableView.reloadData()
    }
    
    func fetchDriverData(driver:[DriverData]){
        
    }
    
    
    
}
