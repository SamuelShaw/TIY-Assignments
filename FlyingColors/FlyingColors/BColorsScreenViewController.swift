//
//  BColorsScreenViewController.swift
//  FlyingColors
//
//  Created by Samuel Shaw on 12/6/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit
import AVFoundation

class BColorsScreenViewController: UIViewController, AVSpeechSynthesizerDelegate
{
    
    let speechSynthesizer = AVSpeechSynthesizer()
    var speechVoice : AVSpeechSynthesisVoice?
    
    @IBOutlet weak var colorNameLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        speechSynthesizer.delegate = self
        
        let voices = AVSpeechSynthesisVoice.speechVoices()
        for voice in voices {
            if "en-AU" == voice.language {
                self.speechVoice = voice
                break;
            }
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool)
    {
        if self.view.backgroundColor == UIColor(red: 244/255, green: 194/255, blue: 194/255, alpha: 1.0)
        {
            colorNameLabel.font = colorNameLabel.font.fontWithSize(50.0)
            colorNameLabel.text = "Baby Pink!"
        }
        else if self.view.backgroundColor == UIColor(red: 137/255, green: 207/255, blue: 240/255, alpha: 1.0)
        {
            colorNameLabel.font = colorNameLabel.font.fontWithSize(50.0)
            colorNameLabel.text = "Baby Blue!"
        }
        else if self.view.backgroundColor == UIColor(red: 128/255, green: 0/255, blue: 32/255, alpha: 1.0)
        {
            colorNameLabel.font = colorNameLabel.font.fontWithSize(60.0)
            colorNameLabel.text = "Burgundy!"
        }
        else if self.view.backgroundColor == UIColor(red: 227/255, green: 218/255, blue: 201/255, alpha: 1.0)
        {
            colorNameLabel.font = colorNameLabel.font.fontWithSize(85.0)
            colorNameLabel.text = "Bone!"
        }
        else if self.view.backgroundColor == UIColor(red: 255/255, green: 85/255, blue: 163/255, alpha: 1.0)
        {
            colorNameLabel.font = colorNameLabel.font.fontWithSize(40.0)
            colorNameLabel.text = "Brilliant Rose!"
        }
        else if self.view.backgroundColor == UIColor(red: 233/255, green: 116/255, blue: 81/255, alpha: 1.0)
        {
            colorNameLabel.font = colorNameLabel.font.fontWithSize(40.0)
            colorNameLabel.text = "Burnt Sienna!"
        }

    }
    
    @IBAction func sayIt(sender: AnyObject)
    {
        var speechUtterance = AVSpeechUtterance(string: "")
        
        if self.view.backgroundColor == UIColor(red: 244/255, green: 194/255, blue: 194/255, alpha: 1.0)
        {
            speechUtterance = AVSpeechUtterance(string: "Baby Pink!")
        }
        else if self.view.backgroundColor == UIColor(red: 137/255, green: 207/255, blue: 240/255, alpha: 1.0)
        {
            speechUtterance = AVSpeechUtterance(string: "Baby Blue!")
        }
        else if self.view.backgroundColor == UIColor(red: 128/255, green: 0/255, blue: 32/255, alpha: 1.0)
        {
            speechUtterance = AVSpeechUtterance(string: "Burgundy!")
        }
        else if self.view.backgroundColor == UIColor(red: 227/255, green: 218/255, blue: 201/255, alpha: 1.0)
        {
            speechUtterance = AVSpeechUtterance(string: "Bone!")
        }
        else if self.view.backgroundColor == UIColor(red: 255/255, green: 85/255, blue: 163/255, alpha: 1.0)
        {
            speechUtterance = AVSpeechUtterance(string: "Brilliant Rose!")
        }
        else if self.view.backgroundColor == UIColor(red: 233/255, green: 116/255, blue: 81/255, alpha: 1.0)
        {
            speechUtterance = AVSpeechUtterance(string: "Burnt Sienna!")
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
        
        // Give the answer, but with a different voice
        //        let speechUtterance2 = AVSpeechUtterance(string: "Don't worry, they'll tell you.")
        //        speechUtterance2.voice = self.speechVoice
        //        speechSynthesizer.speakUtterance(speechUtterance2)
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
