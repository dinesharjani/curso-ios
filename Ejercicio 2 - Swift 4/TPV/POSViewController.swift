//
//  POSViewController.swift
//  TPV
//
//  Created by Dinesh Harjani on 03/03/2018.
//  Copyright © 2018 Dinesh Harjani. All rights reserved.
//

import UIKit

class POSViewController: UIViewController {
    
    @IBOutlet var orderLabels: [UILabel]!
    
    var hamburguesas: Int = 0
    var papasFritas: Int = 0
    var helados: Int = 0
    
    @IBAction func buttonWasTapped(_ sender: UIButton) {
        hamburguesas += 1
        orderLabels[0].text = "Hamburguesas: \(hamburguesas)"
    }
    
    @IBAction func papasFritasWasTapped(_ sender: UIButton) {
        papasFritas += 1
        orderLabels[1].text = "Papas Fritas: \(papasFritas)"
    }
    
    @IBAction func heladosWasTapped(_ sender: UIButton) {
        helados += 1
        orderLabels[2].text = "Helados: \(helados)"
    }
    
    @IBAction func newOrderWasTapped(_ sender: UIButton) {
        hamburguesas = 0
        orderLabels[0].text = "Hamburguesas: \(hamburguesas)"
        papasFritas = 0
        orderLabels[1].text = "Papas Fritas: \(papasFritas)"
        helados = 0
        orderLabels[2].text = "Helados: \(helados)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

