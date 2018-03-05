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
    
    private var items = Array<Order.Item>()
    
    func addHamburger(_ units: Int = 1) {
        items.append(Order.Item(WithUnits: units, andType: "hamburger"))
    }
    
    func addFries(_ units: Int = 1) {
        items.append(Order.Item(WithUnits: units, andType: "fries"))
    }
    
    func addIcreCream(_ units: Int = 1) {
        items.append(Order.Item(WithUnits: units, andType: "ice-cream"))
    }
}
