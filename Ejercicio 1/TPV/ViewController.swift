//
//  ViewController.swift
//  TPV
//
//  Created by Dinesh Harjani on 03/03/2018.
//  Copyright © 2018 Dinesh Harjani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var hamburguesasLabel: UILabel!
    @IBOutlet weak var papasFritasLabel: UILabel!
    @IBOutlet weak var heladosLabel: UILabel!
    
    var hamburguesas: Int = 0
    var papasFritas: Int = 0
    var helados: Int = 0
    
    @IBAction func buttonWasTapped(_ sender: UIButton) {
        hamburguesas += 1
        hamburguesasLabel.text = "Hamburguesas: \(hamburguesas)"
    }
    
    @IBAction func papasFritasWasTapped(_ sender: Any) {
        papasFritas += 1
        papasFritasLabel.text = "Papas Fritas: \(papasFritas)"
    }
    
    @IBAction func heladosWasTapped(_ sender: Any) {
        helados += 1
        heladosLabel.text = "Helados: \(helados)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

