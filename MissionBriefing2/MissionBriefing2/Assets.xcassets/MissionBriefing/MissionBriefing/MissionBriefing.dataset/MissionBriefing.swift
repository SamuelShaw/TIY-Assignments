//
//  ViewController.swift
//  MissionBriefing
//
//  Created by Samuel Shaw on 10/7/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class MissionBriefingViewController: UIViewController
{
    // Place IBOutlet properties below
    
    @IBOutlet weak var agentName: UITextField!
    
    @IBOutlet weak var agentPass: UITextField!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        messageLabel.text = ""
        //
        // 3. The three UI elements need to be emptied on launch
        //    Hint: there is a string literal that represents empty
        //
        
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Action Handlers
    
    @IBAction func authenticateAgent(sender: AnyObject) {
        self.resignFirstResponder()
    }
    
    
    
            
            
            
            
            
            //
            // 6. The mission briefing textview needs to be populated with the briefing from HQ, but it must also include the last
            //    name of the agent that logged in. Perhaps you could use the text in the textfield to get the agent's last name.
            //    How would you inject that last name into the paragraph of the mission briefing?
            //    Set the textview text property to the paragraph in "MissionBriefing.txt"
            //
            
            
            
            
            
            //
            // 7. The view's background color needs to switch to green to indicate a successful login by the agent.
            //
            //    The color's RGB value is Red: 0.585, Green: 0.78, Blue: 0.188 with an alpha of 1. There is a class method on the
            //    UIColor class that returns a color object with custom defined RGBA values. Open the documentation and look for a
            //    method on UIColor that can take red, green, blue and alpha values as arguments.
            //
            //    Once you have the color object, you should be able to set the view's background color to this object.
            //
            
            
            
            
            
            
    
            //
            // 8. The view's background color needs to switch to red to indicate a failed login by the agent.
            //
            //    The color's RGB value is Red: 0.78, Green: 0.188, Blue: 0.188 with an alpha of 1. There is a class method on the
            //    UIColor class that returns a color object with custom defined RGBA values. Open the documentation and look for a
            //    method on UIColor that can take red, green, blue and alpha values as arguments.
            //
            //    Once you have the color object, you should be able to set the view's background color to this object.
            //
            
            
            
            
            
            
        }


