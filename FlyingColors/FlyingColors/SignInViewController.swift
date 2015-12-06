//
//  SignInViewController.swift
//  FlyingColors
//
//  Created by Samuel Shaw on 12/6/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit
import Parse
import ParseTwitterUtils

class SignInViewController: UIViewController
{
    

    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func twitterTapped(sender: AnyObject)
    {
        PFTwitterUtils.initializeWithConsumerKey("uemth1M1j1uocMQjZw6h11Zn6", consumerSecret: "hp70En9aK51SB0w7jrmmKNqeJvDMTAwZsbYJbz66wtDGsbZ1o8")
        
        PFTwitterUtils.logInWithBlock { (user:PFUser?, error:NSError?) -> Void in
            if user == nil
            {
                print("He's dead Jim!")
            }
            else
            {
                print("░░░░░░▄▄▄▄▄▓▓▓▄▄▄░░░░░ ░░░░▄▄▓▓▓▓▓▓▓▓▓▓▓▓▓▄░░░ ░░▄▄▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▀█▄░ ░▓▓▌▓▓▓░░▒▒▒▒▀(◐)▒▒▒▒▒█▓ ░▓▓▌▓▓░▒▒▓(◐)▓░░░▒▓▓(◐)█▓ ▓▓▌▓▓█▄█▀▄▄░▀░▀▄▄▀░░█░█ ▓▓▌▓▓▀▄█▄█░█▀▄▄▄▄▄▀██░█ ░▓▓▌▓▓░█░███▄█▄█▄███░░█ ░▓▓▌▓▓░█░███████████░░█ ░▓▓▌▓▓░█░███████████░░█ ░▓▓▌▓▓░█░███████████░░█ ░▓▓▌▓▓░▀▀█░█▀█▀█▀███░█ ░░▓▓▌▓▓░░░▀▀▄█▄█▄█▄▀░█ ░░▓▓▌▓▓▓▓▀▀▄▄▄▄▄▄▄▄▄▄▀")

            }
        }
    }
    


}
