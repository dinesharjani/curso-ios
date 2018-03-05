//
//  Price.swift
//  TPV
//
//  Created by Dinesh Harjani on 05/03/2018.
//  Copyright © 2018 Dinesh Harjani. All rights reserved.
//

import Foundation

protocol Consumable {
    
    var price: Price { get }
}

struct Price: CustomStringConvertible {
    
    let units: Int
    let cents: Int
    
    var description: String {
        return "\(units).\(cents)€"
    }
}
