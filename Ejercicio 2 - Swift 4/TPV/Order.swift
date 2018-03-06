//
//  Order.swift
//  TPV
//
//  Created by Dinesh Harjani on 05/03/2018.
//  Copyright © 2018 Dinesh Harjani. All rights reserved.
//

import Foundation

class Order: Consumable {
    
    private class Item: Consumable {
        
        let units: Int
        let type: String
        
        var price: Price {
            let itemPrice: Price
            switch type {
            case "hamburger":
                itemPrice = Price(units: 3, cents: 99, multiplier: units)
            case "fries":
                itemPrice = Price(units: 2, cents: 49, multiplier: units)
            case "ice-cream":
                itemPrice = Price(units: 1, cents: 89, multiplier: units)
            default:
                itemPrice = Price()
            }
            
            return itemPrice
        }
        
        init(WithUnits units: Int, andType type: String) {
            self.units = units
            self.type = type
        }
    }
    
    private var items = Array<Order.Item>()
    
    var price: Price {
        var accumuledPrice = Price()
        for item in items {
            accumuledPrice += item.price
        }
        return accumuledPrice
    }
    
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
