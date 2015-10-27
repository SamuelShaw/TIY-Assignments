//
//  VoltageTableViewCell.swift
//  High-Voltage
//
//  Created by Samuel Shaw on 10/25/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class VoltageTableViewCell: UITableViewCell
{
    @IBOutlet weak var voltageTextField: UITextField!
    @IBOutlet weak var voltageLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
