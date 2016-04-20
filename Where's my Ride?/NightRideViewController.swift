//
//  NightRideViewController.swift
//  Where's my Ride?
//
//  Created by Bakshi,Ronak on 4/19/16.
//  Copyright © 2016 Alle,Sai Teja. All rights reserved.
//

import UIKit

class NightRideViewController: UIViewController, UITableViewDataSource,UITableViewDelegate, Operation {
    
    var requestList:[RideRequests] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Night Ride View Controller"
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("route_cell")!
        var keysArray:[String] =  []
        //        for key in routes.routeDictionary.keys.sort(){
        //            keysArray.append(key)
        //        }
        cell.textLabel?.text = keysArray[indexPath.row]
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func onSuccess(sender:AnyObject) {
        //self.pickupArray = sender as! [RideRequests]
    }
    func onError(message: String) {
        
        
    }
    func fetchDriverData(driver: AnyObject) {
        requestList.append(driver as! RideRequests)
        self.table
    }
    
    
    
    
}
