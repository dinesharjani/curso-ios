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
        
        fileprivate enum Food: Consumable, CustomStringConvertible {
            
            case Hamburger
            case Fries
            case IceCream
            
            var price: Price {
                switch self {
                case .Hamburger: return Price(units: 3, cents: 99)
                case .Fries: return Price(units: 2, cents: 49)
                case .IceCream: return Price(units: 1, cents: 89)
                }
            }
            
            var description: String {
                switch self {
                case .Hamburger: return "🍔 Hamburguesas"
                case .Fries: return "🍟 Papas Fritas"
                case .IceCream: return "🍦 Helados"
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
    
    var numberOfItems: Int {
        return items.count
    }
    
    var price: Price {
        var accumuledPrice = Price()
        for item in items {
            accumuledPrice += item.price
        }
        return accumuledPrice
    }
    
    init?(hamburgers: Int, fries: Int, iceCream: Int) {
        guard hamburgers + fries + iceCream > 0 else {
            return nil
        }
        
        self.items.append(Order.Item(WithUnits: hamburgers, andType: .Hamburger))
        self.items.append(Order.Item(WithUnits: fries, andType: .Fries))
        self.items.append(Order.Item(WithUnits: iceCream, andType: .IceCream))
    }
    
    func item(atIndex index: Int) -> (units: Int, description: String, price: Price) {
        let item = items[index]
        return (item.units, item.type.description, item.price)
    }
}
