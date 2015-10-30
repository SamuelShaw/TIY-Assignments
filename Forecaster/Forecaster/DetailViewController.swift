//
//  DetailViewController.swift
//  Forecaster
//
//  Created by Samuel Shaw on 10/29/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class DetailViewController: UIViewController
{
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var cityMapView: MKMapView!
    @IBOutlet weak var chanceRainSubtitle: UILabel!
    @IBOutlet weak var chanceRainPercent: UILabel!
    @IBOutlet weak var temperature: UILabel!
    
    
    var weatherPic = ""
    var mapViewOfCity = ""
    var chanceRainSub = ""
    var rainPercent = ""
    var temp = ""
    
    

    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
       weatherImage.image = UIImage(named: weatherPic)
        chanceRainSubtitle.text = chanceRainSub
        chanceRainPercent.text = rainPercent
        temperature.text = temp
        
        
        
        
        
        
        
        navigationController!.navigationBar.barTintColor = UIColor.brownColor()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
