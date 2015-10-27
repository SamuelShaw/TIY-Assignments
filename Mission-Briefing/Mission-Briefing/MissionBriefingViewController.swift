//
//  ViewController.swift
//  Mission-Briefing
//
//  Created by Samuel Shaw on 10/27/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class MissionBriefingViewController: UIViewController, UITextFieldDelegate
{
    
    //IBOutlets Properties
    @IBOutlet weak var agentName: UITextField!
    @IBOutlet weak var agentPass: UITextField!
    @IBOutlet weak var authenticateButton: UIButton!
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var missionText: UITextView!
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        agentName.text = ""
        agentPass.text = ""
        greetingLabel.text = ""
        missionText.text = ""
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Mark: - Action Button
    @IBAction func buttonPressed(sender: UIButton)
    {
        authenticateAgent()
    }
    
    // Mark: - UITextField Delegate
    func textFieldShouldReturn(textfield: UITextField) -> Bool
    {
        return authenticateAgent()
    }
    
    // Mark: - Private
    func authenticateAgent() -> Bool
    {
        var rc = false
        
        if agentName.text != ""
        {
            let name = agentName.text
            
        if agentPass.text != ""
        {
            rc = true
            agentPass.resignFirstResponder()
            let nameSequence = name!.characters.split(" ").map { String($0)}
            let lastName = nameSequence[1].capitalizedString
            
            greetingLabel.text = "Good evening, Agent \(lastName)"
            
            missionText.text = "This mission will be an arduous one, fraught with peril. You will cover much strange and unfamiliar territory. Should you choose to accept this mission, Agent \(lastName), you will certainly be disavowed, but you will be doing your country a great service. This message will self destruct in 5 seconds."
            
            view.backgroundColor = UIColor(red: 0.585, green: 0.78, blue: 0.188, alpha: 1.0)
            
            }
            else
            {
            greetingLabel.text = "Please enter a valid Password"
            agentFailedToVerify()
            }
            
        }
        else
        {
            greetingLabel.text = "Please enter a valid Name"
            agentFailedToVerify()
        }
        return rc
        
    }
    
        
        func agentFailedToVerify()
        {
            view.backgroundColor = UIColor.redColor()
        }

        
    
}

