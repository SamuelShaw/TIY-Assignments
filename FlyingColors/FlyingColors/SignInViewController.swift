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

class SignInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   /* func alertPop()
    {
        
        let alert = UIAlertController(title: "Continue Without Sign In?", message: "Continuing without signing in disables you from sharing content. Do you wish to Continue?", preferredStyle: UIAlertControllerStyle.Alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel) {
            UIAlertAction in
            self.dismissViewControllerAnimated(true, completion: nil)
        
        }
        
        let continueAction = UIAlertAction(title: "Continue", style: .Default, handler: { action in self.performSegueWithIdentifier("ShowContinueSegue", sender: self)
    }) */
        
    
    func continueButtonTapped(sender: AnyObject)
    {
       self.performSegueWithIdentifier("showContinueSegue", sender: self)
        print("Make a Twitter you bum!")
        // alertPop()
    }
    
    
    
    func twitterTapped(sender: AnyObject)
    {
        PFTwitterUtils.initializeWithConsumerKey("uemth1M1j1uocMQjZw6h11Zn6", consumerSecret: "hp70En9aK51SB0w7jrmmKNqeJvDMTAwZsbYJbz66wtDGsbZ1o8")
        
        PFTwitterUtils.logInWithBlock { (user:PFUser?, error:NSError?) -> Void in
            if user == nil
            {
                print("He's dead Jim!")
            }
            else
            {
                self.performSegueWithIdentifier("ShowSignInSegue", sender: nil)
                print("░░░░░░▄▄▄▄▄▓▓▓▄▄▄░░░░░ ░░░░▄▄▓▓▓▓▓▓▓▓▓▓▓▓▓▄░░░ ░░▄▄▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▀█▄░ ░▓▓▌▓▓▓░░▒▒▒▒▀(◐)▒▒▒▒▒█▓ ░▓▓▌▓▓░▒▒▓(◐)▓░░░▒▓▓(◐)█▓ ▓▓▌▓▓█▄█▀▄▄░▀░▀▄▄▀░░█░█ ▓▓▌▓▓▀▄█▄█░█▀▄▄▄▄▄▀██░█ ░▓▓▌▓▓░█░███▄█▄█▄███░░█ ░▓▓▌▓▓░█░███████████░░█ ░▓▓▌▓▓░█░███████████░░█ ░▓▓▌▓▓░█░███████████░░█ ░▓▓▌▓▓░▀▀█░█▀█▀█▀███░█ ░░▓▓▌▓▓░░░▀▀▄█▄█▄█▄▀░█ ░░▓▓▌▓▓▓▓▀▀▄▄▄▄▄▄▄▄▄▄▀ Hacker voice* I'm in.")
            }
        }
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

