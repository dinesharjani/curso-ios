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
    
    @IBOutlet weak var headerImageView: UIImageView! {
        didSet {
            headerImageView.contentMode = .scaleAspectFill
            headerImageView.image = UIImage(named: "header")
        }
    }
    
    private (set) var hamburguesas = 0
    
    private (set) var papasFritas = 0
    
    private (set) var helados = 0
    
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
    
   @IBAction private func newOrderWasTapped(_ sender: UIButton) {
        if let newOrder = Order(hamburgers: hamburguesas, fries: papasFritas, iceCream: helados) {
            orders.append(newOrder)
            print("\(newOrder.price)")
        }
        
        numberOfItemsInOrder = 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "TPV"
        view.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier == "showSummary", let summaryViewController = segue.destination as? OrderSummaryViewController {
            summaryViewController.order = Order(hamburgers: hamburguesas, fries: papasFritas, iceCream: helados)
        }
    }
}

