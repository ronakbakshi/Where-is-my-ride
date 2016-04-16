//
//  MoreInfoImage.swift
//  Where's my Ride?
//
//  Created by Bakshi,Ronak on 4/15/16.
//  Copyright © 2016 Alle,Sai Teja. All rights reserved.
//

import Foundation
extension UIView {
func addBackground2() {
    // screen width and height: size bounds
    let width = UIScreen.mainScreen().bounds.size.width
    let height = UIScreen.mainScreen().bounds.size.height
    
    let imageViewBackground = UIImageView(frame: CGRectMake(0, 0, width, height))
    imageViewBackground.image = UIImage(named: "MoreInfo.jpg")
    
    // you can change the content mode:
    imageViewBackground.contentMode = UIViewContentMode.ScaleToFill
    
    self.addSubview(imageViewBackground)
    self.sendSubviewToBack(imageViewBackground)
    
}
}