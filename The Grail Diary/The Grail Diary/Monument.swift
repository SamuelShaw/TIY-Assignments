//
//  Monument.swift
//  The Grail Diary
//
//  Created by Samuel Shaw on 10/19/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

class Monument
{
    var name: String
    var location: String
    var architecturalStyle: String
    var picture: String
    
    init(dictionary: NSDictionary)
    {
        name = dictionary["name"] as! String
        location = dictionary["location"] as! String
        architecturalStyle = dictionary["architectural style"] as! String
        picture = dictionary["picture"] as! String
    }
}
