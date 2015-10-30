//
//  cityInfo.swift
//  Forecaster
//
//  Created by Samuel Shaw on 10/30/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class cityInfo: UITableViewCell
{
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var weatherLooksLabel: UILabel!
    @IBOutlet weak var tempNumLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
