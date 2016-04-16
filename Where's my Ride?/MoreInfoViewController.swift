//
//  MoreInfoViewController.swift
//  Where's my Ride?
//
//  Created by Mamidibathula,Manindra Naresh Kumar on 4/14/16.
//  Copyright © 2016 Alle,Sai Teja. All rights reserved.
//

import UIKit

class MoreInfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addBackground2()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func howItWorksBTN(sender: AnyObject) {
        let howItWorksViewController:HowItWorksInfoViewController = self.storyboard?.instantiateViewControllerWithIdentifier("HowItWorksInfoViewController") as! HowItWorksInfoViewController
        
        self.navigationController?.pushViewController(howItWorksViewController, animated: true)
        

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
