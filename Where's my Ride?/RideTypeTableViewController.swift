//
//  RideTypeTableViewController.swift
//  Where's my Ride?
//
//  Created by Bakshi,Ronak on 4/19/16.
//  Copyright © 2016 Alle,Sai Teja. All rights reserved.
//

import UIKit

class RideTypeTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Select a Route Type"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 0{
            let routesViewController:DriverRoutesViewController = self.storyboard?.instantiateViewControllerWithIdentifier("DriverRoutesViewController") as! DriverRoutesViewController
            self.navigationController?.pushViewController(routesViewController, animated: true)
        }else{
            let nightRideViewController:NightRideViewController = self.storyboard?.instantiateViewControllerWithIdentifier("NightRideViewController") as! NightRideViewController
            
            self.navigationController?.pushViewController(nightRideViewController, animated: true)
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier1", forIndexPath: indexPath)
        if indexPath.row == 0{
            cell.textLabel?.text = "Day Ride"
        }else{
            cell.textLabel?.text = "Night Ride"
        }
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        return cell
    }
}
