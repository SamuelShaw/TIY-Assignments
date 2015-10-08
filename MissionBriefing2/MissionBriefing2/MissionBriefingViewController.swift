//
//  ViewController.swift
//  MissionBriefing2
//
//  Created by Samuel Shaw on 10/7/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class MissionBriefingViewController: UIViewController, UITextFieldDelegate {
    // IBOutlets here 
    
    @IBOutlet weak var agentName: UITextField!
    @IBOutlet weak var agentPass: UITextField!
    @IBOutlet weak var messageLabel: UILabel!
    
    // button function started below for authenticateAgent
    // set uilabel to match uitextfield
    
    @IBAction func authenticateAgent(sender: UIButton)
    {
        
       messageLabel.text = agentName.text
        
        }
        
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       messageLabel.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        //reused code format for divide from sayMyName
    func goodEvening() -> String {
        var rc = agentName.text
        if let name2 = agentName.text
        {
            rc = agentName.text
            agentName.resignFirstResponder()
            let nameComponents = agentName.text?.characters.split(" ").map {
                String($0) }
            messageLabel.text = "Good Evening Agent, \(nameComponents)"
        }
        return rc!
    }

}

