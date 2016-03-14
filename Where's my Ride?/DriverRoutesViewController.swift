//
//  DriverRoutesViewController.swift
//  Where's my Ride?
//
//  Created by Bakshi,Ronak on 3/13/16.
//  Copyright © 2016 Alle,Sai Teja. All rights reserved.
//

import UIKit

class DriverRoutesViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var routes:DriverRoutes!
    
    
    
    //This fucntion displays the alert box showing the message for user  to turn on the location
    func displayAlertControllerWithTitle(title:String, message:String) {
        let uiAlertController:UIAlertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        uiAlertController.addAction(UIAlertAction(title: "OK", style:UIAlertActionStyle.Cancel, handler:{(action:UIAlertAction)->Void in  }))
        self.presentViewController(uiAlertController, animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Select Route"
        routes = DriverRoutes()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return routes.routeDictionary.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("route_cell")!
        var keysArray:[String] =  []
        for key in routes.routeDictionary.keys{
            keysArray.append(key)
        }
        cell.textLabel?.text = keysArray[indexPath.row]
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
