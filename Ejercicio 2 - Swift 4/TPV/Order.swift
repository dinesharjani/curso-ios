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
        
        fileprivate enum Food {
            case Hamburger
            case Fries
            case IceCream
        }
        
        let units: Int
        let type: Food
        
        var price: Price {
            let itemPrice: Price
            switch type {
            case .Hamburger:
                itemPrice = Price(units: 3, cents: 99, multiplier: units)
            case .Fries:
                itemPrice = Price(units: 2, cents: 49, multiplier: units)
            case .IceCream:
                itemPrice = Price(units: 1, cents: 89, multiplier: units)
            }
            
            return itemPrice
        }
        
        init(WithUnits units: Int, andType type: Food) {
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
        items.append(Order.Item(WithUnits: units, andType: .Hamburger))
    }
    
    func addFries(_ units: Int = 1) {
        items.append(Order.Item(WithUnits: units, andType: .Fries))
    }
    
    func addIcreCream(_ units: Int = 1) {
        items.append(Order.Item(WithUnits: units, andType: .IceCream))
    }
}
