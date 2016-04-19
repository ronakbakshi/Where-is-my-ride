//
//  BackgroundImageView.swift
//  Where's my Ride?
//
//  Created by Bakshi,Ronak on 4/14/16.
//  Copyright © 2016 Alle,Sai Teja. All rights reserved.
//

import Foundation
extension UIView {
    func addBackground() {
        // screen width and height:
        let width = UIScreen.mainScreen().bounds.size.width
        let height = UIScreen.mainScreen().bounds.size.height
        
        let imageViewBackground = UIImageView(frame: CGRectMake(0, 0, width, height*1.5))
        imageViewBackground.image = UIImage(named: "bgHome.png")
        
        // you can change the content mode:
        imageViewBackground.contentMode = UIViewContentMode.Center
        
        self.addSubview(imageViewBackground)
        self.sendSubviewToBack(imageViewBackground)
    }}
