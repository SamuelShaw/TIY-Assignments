//
//  AdvColorsViewController.swift
//  FlyingColors
//
//  Created by Samuel Shaw on 12/5/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class AdvColorsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{

    @IBOutlet weak var tableView: UITableView!
    

    var advColors : [UIColor] = []
    
    
//    var advColors : [UIColor] = [UIColor(red: 229, green: 43, blue: 80, alpha: 1),
//                                UIColor(red: 255, green: 191, blue: 0, alpha: 1),
//                                UIColor(red: 153, green: 102, blue: 204, alpha: 1),
//                                UIColor(red: 251, green: 206, blue: 177, alpha: 1)]
    
    var selectedColor : UIColor?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
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
