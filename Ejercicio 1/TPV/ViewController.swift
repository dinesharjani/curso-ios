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
    
    var hamburguesas: Int = 0
    
    @IBAction func buttonWasTapped(_ sender: UIButton) {
        hamburguesas += 1
        hamburguesasLabel.text = "Hamburguesas: \(hamburguesas)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

