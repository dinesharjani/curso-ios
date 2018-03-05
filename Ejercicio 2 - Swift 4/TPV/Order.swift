//
//  Order.swift
//  TPV
//
//  Created by Dinesh Harjani on 05/03/2018.
//  Copyright © 2018 Dinesh Harjani. All rights reserved.
//

import Foundation

class Order {
    
    private class Item {
        
        let units: Int
        let type: String
        
        init(WithUnits units: Int, andType type: String) {
            self.units = units
            self.type = type
        }
    }
}
