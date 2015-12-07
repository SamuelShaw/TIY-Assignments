//
//  AdvColorScreenViewController.swift
//  FlyingColors
//
//  Created by Samuel Shaw on 12/5/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit
import AVFoundation
import Parse

class AColorScreenViewController: UIViewController, AVSpeechSynthesizerDelegate
{
    
    let speechSynthesizer = AVSpeechSynthesizer()
    var speechVoice : AVSpeechSynthesisVoice?
    
    @IBOutlet weak var colorNameLabel: UILabel!

    override func viewDidLoad()
    {
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

 override func viewWillAppear(animated: Bool)
{
    if self.view.backgroundColor == UIColor(red: 229/255, green: 43/255, blue: 80/255, alpha: 1.0)
    {
        colorNameLabel.font = colorNameLabel.font.fontWithSize(40.0)
        colorNameLabel.text = "AMARANTH!"
        print("try saying that 20 times fast..")
    }
    else if self.view.backgroundColor == UIColor(red: 255/255, green: 191/255, blue: 0/255, alpha: 1.0)
    {
        colorNameLabel.font = colorNameLabel.font.fontWithSize(80.0)
        colorNameLabel.text = "AMBER!"
        print("ha! your name is a color!")
    }
    else if self.view.backgroundColor == UIColor(red: 153/255, green: 102/255, blue: 204/255, alpha: 1.0)
    {
        colorNameLabel.font = colorNameLabel.font.fontWithSize(40.0)
        colorNameLabel.text = "AMETHYST!"
        print("steven universe anyone?")
    }
    else if self.view.backgroundColor == UIColor(red: 251/255, green: 206/255, blue: 177/255, alpha: 1.0)
    {
        colorNameLabel.font = colorNameLabel.font.fontWithSize(62.0)
        colorNameLabel.text = "APRICOT!"
    }
    else if self.view.backgroundColor == UIColor(red: 127/255, green: 255/255, blue: 112/255, alpha: 1.0)
    {
        colorNameLabel.font = colorNameLabel.font.fontWithSize(40.0)
        colorNameLabel.text = "AQUAMARINE!"
        print("or submarine whatever you like.")
    }
    else if self.view.backgroundColor == UIColor(red: 0/255, green: 127/255, blue: 255/255, alpha: 1.0)
    {
        colorNameLabel.text = "AZURE!"
    }
}

    //Speech
    // This is the action called when the user presses the button.
    @IBAction func sayIt(sender: AnyObject)
    {
        var speechUtterance = AVSpeechUtterance(string: "")
        
        if self.view.backgroundColor == UIColor(red: 229/255, green: 43/255, blue: 80/255, alpha: 1.0)
        {
            speechUtterance = AVSpeechUtterance(string: "AMARANTH")
        }
         else if self.view.backgroundColor == UIColor(red: 255/255, green: 191/255, blue: 0/255, alpha: 1.0)
        {
            speechUtterance = AVSpeechUtterance(string: "AMBER!")
        }
        else if self.view.backgroundColor == UIColor(red: 153/255, green: 102/255, blue: 204/255, alpha: 1.0)
        {
            speechUtterance = AVSpeechUtterance(string: "AMETHYST!")
        }
        else if self.view.backgroundColor == UIColor(red: 251/255, green: 206/255, blue: 177/255, alpha: 1.0)
        {
            speechUtterance = AVSpeechUtterance(string: "Apricot!")
        }
        else if self.view.backgroundColor == UIColor(red: 127/255, green: 255/255, blue: 112/255, alpha: 1.0)
        {
            speechUtterance = AVSpeechUtterance(string: "Aquamarine!")
        }
        else if self.view.backgroundColor == UIColor(red: 0/255, green: 127/255, blue: 255/255, alpha: 1.0)
        {
            speechUtterance = AVSpeechUtterance(string: "Azure!")
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


