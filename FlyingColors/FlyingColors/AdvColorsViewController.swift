//
//  AdvColorsViewController.swift
//  FlyingColors
//
//  Created by Samuel Shaw on 12/5/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit
import Parse

class AdvColorsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{

    @IBOutlet weak var tableView: UITableView!
    
//trying to do what i did in the color view controller except in this case i want to use the hex pod so i can add more colors other than the ones premade in xcode, but the pod usage is giving me trouble..
    var advColors : [UIColor] = [UIColor(red: 229/255, green: 43/255, blue: 80/255, alpha: 1.0), //Amaranth
                                UIColor(red: 255/255, green: 191/255, blue: 0/255, alpha: 1.0), //Amber
                                UIColor(red: 153/255, green: 102/255, blue: 204/255, alpha: 1.0), //Amethyst
                                UIColor(red: 251/255, green: 206/255, blue: 177/255, alpha: 1.0), //Apricot
                                UIColor(red: 127/255, green: 255/255, blue: 112/255, alpha: 1.0), //Aquamarine
                                UIColor(red: 0/255, green: 127/255, blue: 255/255, alpha: 1.0)] //Azure
//                                UIColor(red: 137/255, green: 207/255, blue: 240/255, alpha: 1.0)] //Baby Blue


    

    
    
    var selectedColor : UIColor?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    override func viewWillAppear(animated: Bool)
    {
        self.tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return advColors.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell()
        cell.backgroundColor = advColors[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        self.selectedColor = advColors[indexPath.row]
        performSegueWithIdentifier("ToAdvColorScreenSegue", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "ToAdvColorScreenSegue"
        {
            segue.destinationViewController.view.backgroundColor = self.selectedColor
        }
    }
  
    
    /* func UIColorFromRGB(rgbValue: UInt) -> UIColor 
        {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )

    }
    */

  

}
