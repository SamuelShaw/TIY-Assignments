//
//  Venue.swift
//  VenueMenu
//
//  Created by Samuel Shaw on 11/29/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

struct Venue
{
    var name: String
    var url: String?
    var id: String
    let bestPhoto: FourSquarePhoto?
    
    init?(data: NSObject) {
        if let d = data as? NSDictionary{
            name = d["name"] as? String ?? ""
            url = d["url"] as? String
            id = d["id"]as? String ?? ""
            bestPhoto = FourSquarePhoto(data: d["bestPhoto"] as? NSDictionary)
        } else {
            return nil
        }
        
    }
    
}