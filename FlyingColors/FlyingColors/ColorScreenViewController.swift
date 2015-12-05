//
//  ColorScreenViewController.swift
//  FlyingColors
//
//  Created by Samuel Shaw on 12/5/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class ColorScreenViewController: UIViewController
{
    
    @IBOutlet weak var colorNameLabel: UILabel!

    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
//    [UIColor.redColor(), UIColor.greenColor(), UIColor.blueColor(), UIColor.yellowColor(), UIColor.orangeColor(),UIColor.brownColor(), UIColor.purpleColor(), UIColor.blackColor()]
    override func viewWillAppear(animated: Bool)
    {
        if self.view.backgroundColor == UIColor.redColor()
        {
            colorNameLabel.text = "RED!"
        }
        else if self.view.backgroundColor == UIColor.greenColor()
        {
            colorNameLabel.text = "GREEN!"
        }
        else if self.view.backgroundColor == UIColor.blueColor()
        {
            colorNameLabel.text = "BLUE!"
        }
        else if self.view.backgroundColor == UIColor.yellowColor()
        {
            colorNameLabel.text = "YELLOW!"
        }
        else if self.view.backgroundColor == UIColor.orangeColor()
        {
            colorNameLabel.text = "ORANGE!"
        }
        else if self.view.backgroundColor == UIColor.brownColor()
        {
            colorNameLabel.text = "BROWN!"
        }
        else if self.view.backgroundColor == UIColor.purpleColor()
        {
            colorNameLabel.text = "PURPLE!"
        }
        else if self.view.backgroundColor == UIColor.blackColor()
        {
            colorNameLabel.text = "BLACK!"
        }
        
    }


}
