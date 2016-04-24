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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func howItWorksBTN(sender: AnyObject) {
        let howItWorksViewController:HowItWorksInfoViewController = self.storyboard?.instantiateViewControllerWithIdentifier("HowItWorksInfoViewController") as! HowItWorksInfoViewController
        self.navigationController?.pushViewController(howItWorksViewController, animated: true)
    }

}
