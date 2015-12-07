//
//  ColorScreenViewController.swift
//  FlyingColors
//
//  Created by Samuel Shaw on 12/5/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit
import Parse
import AVFoundation

class PrimeColorScreenViewController: UIViewController, AVSpeechSynthesizerDelegate
{
    let speechSynthesizer = AVSpeechSynthesizer()
    var speechVoice : AVSpeechSynthesisVoice?
    
    
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
            print("Yeah you love Red huh?")
        }
        else if self.view.backgroundColor == UIColor.greenColor()
        {
            colorNameLabel.text = "GREEN!"
        }
        else if self.view.backgroundColor == UIColor.blueColor()
        {
            colorNameLabel.text = "BLUE!"
            print("everyone likes blue")
        }
        else if self.view.backgroundColor == UIColor.yellowColor()
        {
            colorNameLabel.font = colorNameLabel.font.fontWithSize(65.0)
            colorNameLabel.text = "YELLOW!"
        }
        else if self.view.backgroundColor == UIColor.orangeColor()
        {
            colorNameLabel.font = colorNameLabel.font.fontWithSize(65.0)
            colorNameLabel.text = "ORANGE!"
            print("nothing ryhmes with this dumb word")
        }
        else if self.view.backgroundColor == UIColor.brownColor()
        {
            colorNameLabel.font = colorNameLabel.font.fontWithSize(65.0)
            colorNameLabel.text = "BROWN!"
        }
        else if self.view.backgroundColor == UIColor.purpleColor()
        {
            colorNameLabel.font = colorNameLabel.font.fontWithSize(65.0)
            colorNameLabel.text = "PURPLE!"
        }
        else if self.view.backgroundColor == UIColor.blackColor()
        {
            colorNameLabel.text = "BLACK!"
            print("saved the best for last :p")
        }
        
    
    }
    
    @IBAction func sayIt(sender: AnyObject)
    {
        var speechUtterance = AVSpeechUtterance(string: "")
        
        if self.view.backgroundColor == UIColor.redColor()
        {
            speechUtterance = AVSpeechUtterance(string: "Red!")
        }
        else if self.view.backgroundColor == UIColor.greenColor()
        {
            speechUtterance = AVSpeechUtterance(string: "Green!")
        }
        else if self.view.backgroundColor == UIColor.blueColor()
        {
            speechUtterance = AVSpeechUtterance(string: "Blue!")
        }
        else if self.view.backgroundColor == UIColor.yellowColor()
        {
            speechUtterance = AVSpeechUtterance(string: "Yellow!")
        }
        else if self.view.backgroundColor == UIColor.orangeColor()
        {
            speechUtterance = AVSpeechUtterance(string: "Orange!")
        }
        else if self.view.backgroundColor == UIColor.brownColor()
        {
            speechUtterance = AVSpeechUtterance(string: "Brown!")
        }
        else if self.view.backgroundColor == UIColor.purpleColor()
        {
            speechUtterance = AVSpeechUtterance(string: "Purple!")
        }
        else if self.view.backgroundColor == UIColor.blackColor()
        {
            speechUtterance = AVSpeechUtterance(string: "Black!")
        }

        
        // set the voice
        speechUtterance.voice = self.speechVoice
        
        // rate is 0.0 to 1.0 (default defined by AVSpeechUtteranceDefaultSpeechRate)
        speechUtterance.rate = 0.1
        
        // multiplier is between >0.0 and 2.0 (default 1.0)
        speechUtterance.pitchMultiplier = 1.25
        
        // Volume from 0.0 to 1.0 (default 1.0)
        speechUtterance.volume = 0.75
        
        // Delays before and after saying the phrase
        speechUtterance.preUtteranceDelay = 0.0
        speechUtterance.postUtteranceDelay = 0.0
        
        speechSynthesizer.speakUtterance(speechUtterance)
    }
    
    // Called before speaking an utterance
    func speechSynthesizer(synthesizer: AVSpeechSynthesizer, didStartSpeechUtterance utterance: AVSpeechUtterance) {
        print("About to say '\(utterance.speechString)'");
    }
    
    // Called when the synthesizer is finished speaking the utterance
    func speechSynthesizer(synthesizer: AVSpeechSynthesizer, didFinishSpeechUtterance utterance: AVSpeechUtterance) {
        print("Finished saying '\(utterance.speechString)");
    }
    
    // This method is called before speaking each word in the utterance.
    func speechSynthesizer(synthesizer: AVSpeechSynthesizer, willSpeakRangeOfSpeechString characterRange: NSRange, utterance: AVSpeechUtterance) {
        let startIndex = utterance.speechString.startIndex.advancedBy(characterRange.location)
        let endIndex = startIndex.advancedBy(characterRange.length)
        print("Will speak the word '\(utterance.speechString.substringWithRange(startIndex..<endIndex))'");
    }
    
    


}
