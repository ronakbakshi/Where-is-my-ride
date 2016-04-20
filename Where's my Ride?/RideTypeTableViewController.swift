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
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
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
   
    
    //    @IBOutlet weak var tableVIew: UITableView!
    //    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    //        if segue.identifier == "segueID10"{
    //            if let rdTVC:RouteDetailsTableViewController = segue.destinationViewController as? RouteDetailsTableViewController{
    //                if let comingView = tableVIew.indexPathForSelectedRow?.row{
    //                    var route:[String] = []
    //                    for value:String in routes.routeDictionary.values{
    //                        route.append(value)
    //                    }
    //
    //                    rdTVC.routes  = route[comingView]
    //                }
    //            }
    //        }
    //
    //
    //    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the specified item to be editable.
    return true
    }
    */
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the item to be re-orderable.
    return true
    }
    */
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
