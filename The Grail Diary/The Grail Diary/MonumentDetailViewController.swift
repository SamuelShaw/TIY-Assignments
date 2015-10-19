//
//  MonumentDetailViewController.swift
//  The Grail Diary
//
//  Created by Samuel Shaw on 10/19/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class MonumentDetailViewController: UIViewController
{
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var architecuralStyleLabel: UILabel!
    @IBOutlet var picture: UIImageView!
    
    var monument = Monument?()
    
    override func viewDidLoad()
    {
    super.viewDidLoad()
        nameLabel.text = monument!.name
        locationLabel.text = monument!.location
        architecuralStyleLabel.text = monument!.architecturalStyle
        // Image
        picture.image = UIImage(named: monument!.picture)
    }
    
}
