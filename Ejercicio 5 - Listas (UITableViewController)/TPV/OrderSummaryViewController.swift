//
//  OrderSummaryViewController.swift
//  TPV
//
//  Created by Dinesh Harjani on 10/03/2018.
//  Copyright © 2018 Dinesh Harjani. All rights reserved.
//

import UIKit

class OrderSummaryViewController: UIViewController {

    @IBOutlet weak var summaryTableView: UITableView!
    
    @IBOutlet weak var summaryLabel: UILabel! {
        didSet {
            guard order != nil else {
                summaryLabel.text = "Total: 0.0€"
                return
            }

            summaryLabel.text = "Total: \(order!.price)"
        }
    }
    
    public var order: Order?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Resumen"
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onViewControllerTapped(_:))))
    }
    
    @objc func onViewControllerTapped(_ sender: Any?) {
        navigationController?.popViewController(animated: true)
    }
}
