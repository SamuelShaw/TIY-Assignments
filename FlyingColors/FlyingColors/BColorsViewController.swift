//
//  BColorsViewController.swift
//  FlyingColors
//
//  Created by Samuel Shaw on 12/6/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class BColorsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{

    @IBOutlet weak var tableView: UITableView!
    
    var selectedColor : UIColor?
    
    var colors : [UIColor] = [UIColor(red: 244/255, green: 194/255, blue: 194/255, alpha: 1.0), //baby pink
                            UIColor(red: 137/255, green: 207/255, blue: 240/255, alpha: 1.0), //baby blue
                            UIColor(red: 128/255, green: 0/255, blue: 32/255, alpha: 1.0), //burgundy
                            UIColor(red: 227/255, green: 218/255, blue: 201/255, alpha: 1.0), //bone
                            UIColor(red: 255/255, green: 85/255, blue: 163/255, alpha: 1.0), //brilliant rose
                            UIColor(red: 233/255, green: 116/255, blue: 81/255, alpha: 1.0)] //burnt sienna
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.tableView.delegate = self
        self.tableView.dataSource = self
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
        self.performSegueWithIdentifier("ToBColorScreenSegue", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "ToBColorScreenSegue"
        {
            segue.destinationViewController.view.backgroundColor = self.selectedColor
        }
        
    }


}
