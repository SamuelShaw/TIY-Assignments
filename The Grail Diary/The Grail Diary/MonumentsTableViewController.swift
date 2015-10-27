//
//  MonumentsTableViewController.swift
//  The Grail Diary
//
//  Created by Samuel Shaw on 10/19/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class MonumentsTableViewController: UITableViewController {
    
    var monuments = Array<Monument>()
    
    var name: String = ""
    var location: String = ""
    var architecturalStyle: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Historical Monuments"
        
        loadmonumentList()
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return monuments.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("monumentCell", forIndexPath: indexPath)

        // Configure the cell...
        
        let amonument = monuments[indexPath.row]
        
        //        cell.textLabel?.text = amonument.name
        cell.textLabel?.text = amonument.name
        cell.detailTextLabel?.text = amonument.location

        return cell
    }
    
    func loadmonumentList()
    {
        do
        {
            let filePath = NSBundle.mainBundle().pathForResource("monuments", ofType: "json")
            let dataFromFile = NSData(contentsOfFile: filePath!)
            let monumentData: NSArray! = try NSJSONSerialization.JSONObjectWithData(dataFromFile!, options: []) as! NSArray
            
            for monumentDictionary in monumentData
            {
                let amonument = Monument(dictionary: monumentDictionary as! NSDictionary)
                
                monuments.append(amonument)
            }
                    monuments.sortInPlace{$0.name < $1.name}
            
        }
        catch let error as NSError
        {
            print(error)
        }
        
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        let amonument = monuments[indexPath.row]
        let NVCfromTemplate = storyboard?.instantiateViewControllerWithIdentifier("MonumentDetailViewController") as! MonumentDetailViewController
        NVCfromTemplate.monument = amonument
        presentViewController(NVCfromTemplate, animated: true, completion: nil)
        
    }
        
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
