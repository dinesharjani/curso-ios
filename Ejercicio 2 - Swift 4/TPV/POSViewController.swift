//
//  POSViewController.swift
//  TPV
//
//  Created by Dinesh Harjani on 03/03/2018.
//  Copyright © 2018 Dinesh Harjani. All rights reserved.
//

import UIKit

class POSViewController: UIViewController {
    
    private struct Constants {
        static let burgersLabelIndex = 0
        static let friesLabelIndex = 1
        static let iceCreamLabelIndex = 2
    }
    
    @IBOutlet var orderLabels: [UILabel]!
    
    private (set) var hamburguesas = 0 {
        didSet {
            orderLabels[Constants.burgersLabelIndex].text = "Hamburguesas: \(hamburguesas)"
        }
    }
    
    private (set) var papasFritas = 0 {
        didSet {
            orderLabels[Constants.friesLabelIndex].text = "Papas Fritas: \(papasFritas)"
        }
    }
    
    private (set) var helados = 0 {
        didSet {
            orderLabels[Constants.iceCreamLabelIndex].text = "Helados: \(helados)"
        }
    }
    
    private var numberOfItemsInOrder: Int {
        get {
            return hamburguesas + papasFritas + helados
        }
        set {
            hamburguesas = 0
            papasFritas = 0
            helados = 0
        }
    }
    
    private var orders = [Order]()
    
    @IBAction private func buttonWasTapped(_ sender: UIButton) {
        hamburguesas += 1
    }
    
    @IBAction private func papasFritasWasTapped(_ sender: UIButton) {
        papasFritas += 1
    }
    
    @IBAction private func heladosWasTapped(_ sender: UIButton) {
        helados += 1
    }
    
    @IBAction private func newOrderWasTapped(_ sender: UIButton) {
        let newOrder = Order()
        newOrder.addHamburger(hamburguesas)
        newOrder.addFries(papasFritas)
        newOrder.addIcreCream(helados)
        orders.append(newOrder)
        
        numberOfItemsInOrder = 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

