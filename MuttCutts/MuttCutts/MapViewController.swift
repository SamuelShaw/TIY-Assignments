//
//  ViewController.swift
//  MuttCutts
//
//  Created by Samuel Shaw on 10/28/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, UIPopoverPresentationControllerDelegate
    
{
    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let tiyOrlando = CLLocationCoordinate2DMake(28.540923, -81.38216)
        let tiyOrlandoAnnotation = MKPointAnnotation()
        tiyOrlandoAnnotation.title = "The Iron Yard"
        tiyOrlandoAnnotation.subtitle = "Orlando"
        
        let tiyTampa = CLLocationCoordinate2DMake(27.770068, -82.63642)
        let tiyTampaAnnotation = MKPointAnnotation()
        tiyTampaAnnotation.title = "The Iron Yard"
        tiyTampaAnnotation.subtitle = "Tampa"
        
        let annotations = [tiyOrlandoAnnotation]
        mapView.addAnnotations(annotations)
        
        mapView.showAnnotations(annotations, animated: true)
        
        mapView.camera.altitude *= 2
        
        let viewRegion = MKCoordinateRegionMakeWithDistance(tiyOrlando, 2000, 2000)
        mapView.setRegion(viewRegion, animated: true)
        
        let orlandoLocation = CLLocation(coordinate: tiyOrlando, altitude: 0, horizontalAccuracy: 0, verticalAccuracy: 0, timestamp: NSDate())
        let tampaLocation = CLLocation(coordinate: tiyTampa, altitude: 0, horizontalAccuracy: 0, verticalAccuracy: 0, timestamp: NSDate())
        let lineOfSightDistance = orlandoLocation.distanceFromLocation((tampaLocation))
//        print("distance between \(tiyOrlandoAnnotation.subtitle!) and \(tiy)
        
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Mark: - Popover View
    
    @IBAction func showPopView(sender: UIBarButtonItem)
    {
        self.performSegueWithIdentifier("showView", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "showView"
        {
            var vc = segue.destinationViewController as! UIViewController
            
            var controller = vc.presentationController
            if controller != nil
            {
                controller?.delegate = self
            }
        }
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle
    {
        return .None
    }


}

