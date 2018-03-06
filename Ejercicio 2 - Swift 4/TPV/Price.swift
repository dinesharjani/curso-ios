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
    
    init(units: Int = 0, cents: Int = 0, multiplier: Int = 1) {
        self.units = (units * multiplier) + (cents * multiplier / 100)
        self.cents = (cents * multiplier % 100)
    }
    
    init(_ price: Price, multiplier: Int = 1) {
        self.init(units: price.units, cents: price.cents, multiplier: multiplier)
    }
    
    static func + (left: Price, right: Price) -> Price {
        let unitsOverflow = (left.cents + right.cents) / 100
        let totalCents = (left.cents + right.cents) % 100
        return Price(units: left.units + right.units + unitsOverflow, cents: totalCents)
    }
    
    static func += (left: inout Price, right: Price) {
        left = left + right
    }
}
