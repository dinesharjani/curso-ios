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
        
        fileprivate enum Food: Consumable {
            case Hamburger
            case Fries
            case IceCream
            
            var price: Price {
                switch self {
                case .Hamburger:
                    return Price(units: 3, cents: 99)
                case .Fries:
                    return Price(units: 2, cents: 49)
                case .IceCream:
                    return Price(units: 1, cents: 89)
                }
            }
        }
        
        let units: Int
        let type: Food
        
        var price: Price {
            return Price(type.price, multiplier: units)
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
