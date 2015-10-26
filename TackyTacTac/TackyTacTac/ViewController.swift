//
//  ViewController.swift
//  TackyTacTac
//
//  Created by Samuel Shaw on 10/26/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    var grid = [[0,0,0], [0,0,0], [0,0,0]]
    
    var isPlayer1Turn = true
    
    var player1Score = 0
    var player2Score = 0
    var stalemateScore = 0
    
    //counter labels for wins
    var scoreNumber = 0

    
    //Games won labels
    //Player 1
    let player1Games = UILabel(frame: CGRect(x: 0, y: 30, width: 200, height: 1100))
    
    //Player 2
    let player2Games = UILabel(frame: CGRect(x: 0, y: 30, width: 300, height: 1170))
    
    let gamesStatusLabel = UILabel(frame: CGRect(x: 0, y: 80, width: 200, height: 50))
    
    //stalemates
    let staleMates = UILabel(frame: CGRect(x: 0, y: 30, width: 300, height: 1230))

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
        //Games won for players 1 & 2 config
        player1Games.text = "Player 1 Wins:"
        player1Games.textAlignment = .Left
        player1Games.font = UIFont(name: "AvenirNext-DemiBoldItalic", size: 25.0)
        player1Games.textColor = UIColor.magentaColor()
        view.addSubview(player1Games)
        
        
        //Player 2
        player2Games.text = "Player 2 Wins:"
        player2Games.textAlignment = .Left
        player2Games.font = UIFont(name: "AvenirNext-DemiBoldItalic", size: 25.0)
        player2Games.textColor = UIColor.yellowColor()
        view.addSubview(player2Games)
        
        //stalemates
        staleMates.text = "Stalemates:"
        staleMates.textAlignment = .Left
        staleMates.font = UIFont(name: "AvenirNext-DemiBoldItalic" , size: 25.0)
        staleMates.textColor = UIColor.whiteColor()
        view.addSubview(staleMates)
        
        
        let reset = UIButton(type: UIButtonType.System) as UIButton
        reset.frame = CGRect(x: 183, y: 90, width: 50, height: 70)
        reset.backgroundColor = UIColor.brownColor()
        reset.setTitle("Reset", forState: UIControlState.Normal)
        reset.addTarget(self, action: "Action:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(reset)
        
        
        
        
        
        
        view.backgroundColor = UIColor.brownColor()
        
        gamesStatusLabel.text = "Player 1 Turn"
        gamesStatusLabel.textAlignment = .Center
        gamesStatusLabel.center.x = view.center.x
        gamesStatusLabel.font = UIFont(name: "AvenirNext-DemiBoldItalic", size: 25.0)
        gamesStatusLabel.textColor = UIColor.blackColor()
        
        view.addSubview(gamesStatusLabel)
        
        let screenHeight = Int(UIScreen.mainScreen().bounds.height)
        
        let screenWidth = Int(UIScreen.mainScreen().bounds.width)
        let buttonHW = 100
        let buttonSpacing = 4
        
        let gridHW = (buttonHW * 3) + (buttonSpacing * 2)
        
        let leftSpacing = (screenWidth - gridHW) / 2
        let topSpacing = (screenHeight - gridHW) / 2
        
        for (r, row) in grid.enumerate()
        {
            for (c, _) in row.enumerate()
            {
                let x = c * (buttonHW + buttonSpacing) + leftSpacing
                let y = r * (buttonHW + buttonSpacing) + topSpacing
                let button = TTTButton(frame: CGRect(x: x, y: y, width: buttonHW, height: buttonHW))
                button.backgroundColor = UIColor.cyanColor()
                
                button.row = r
                button.col = c
                
                button.addTarget(self, action: "spacePressed:", forControlEvents: .TouchUpInside)
                
                view.addSubview(button)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func spacePressed(button: TTTButton)
    {
        if button.player == 0
        {
            //        if isPlayer1Turn
            //        {
            //            button.player = 1
            //        }
            //        else
            //        {
            //            button.player = 2
            //        }
            button.player = isPlayer1Turn ? 1 : 2
            
            grid[button.row] [button.col] = isPlayer1Turn ? 1 : 2
            
            isPlayer1Turn = !isPlayer1Turn
            if !isPlayer1Turn
            {
                gamesStatusLabel.text = "Player 2 Turn"
                gamesStatusLabel.textAlignment = .Center
            }
            else
            {
                gamesStatusLabel.text = "Player 1 Turn"
                gamesStatusLabel.textAlignment = .Center
            }
            
            func checkForWinner()
            {
                let possibilities =
                [
                    ((0,0),(0,1),(0,2)),
                    ((1,0),(1,1),(1,2)),
                    ((2,0),(2,1),(2,2)),
                    ((0,0),(1,0),(2,0)),
                    ((0,1),(1,1),(2,1)),
                    ((0,2),(1,2),(2,2)),
                    ((0,0),(1,1),(2,2)),
                    ((2,0),(1,1),(0,2))
                ]
                
                for possibility in possibilities
                {
                    let (p1,p2,p3) = possibility
                    let value1 = grid [p1.0][p1.1]
                    let value2 = grid [p2.0][p2.1]
                    let value3 = grid [p3.0][p3.1]
                    
                    if value1 == value2 && value2 == value3
                    {
                        if value1 != 0
                        {
                            print("Player \(value1) wins!")
                        }
                        else
                        {
                            print("No winner: all zeros")
                        }
                    }
                    else
                    {
                        print("Does not match")
                    }
                }
            }
        }
    }

}



class TTTButton: UIButton
{
    var row = 0
    var col = 0
    
    var player = 0
        {
            didSet
            {
                    switch player
                    {
                    case 1: backgroundColor = UIColor.magentaColor()
                    case 2: backgroundColor = UIColor.yellowColor()
                    default: backgroundColor = UIColor.cyanColor()
                    }
            }
    }
}

