//
//  ViewController.swift
//  FlyingColors
//
//  Created by Samuel Shaw on 12/5/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit
import Parse

class PrimeColorsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{

    @IBOutlet weak var tableView: UITableView!
    
    var selectedColor : UIColor?
    
    var colors: [UIColor] = [UIColor.redColor(), UIColor.greenColor(), UIColor.blueColor(), UIColor.yellowColor(), UIColor.orangeColor(),UIColor.brownColor(), UIColor.purpleColor(), UIColor.blackColor()]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }

    override func viewWillAppear(animated: Bool)
    
    {
        self.tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return colors.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell()
        cell.backgroundColor = self.colors[indexPath.row]
        let image : UIImage = UIImage(named: "1449464667_icon_24_one_finger_tap")!
        cell.imageView!.image = image


        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        self.selectedColor = self.colors[indexPath.row]
        self.performSegueWithIdentifier("ToColorScreenSegue", sender: self)
        
        print("")
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "ToColorScreenSegue"
        {
            segue.destinationViewController.view.backgroundColor = self.selectedColor
        }
        
    }


}

