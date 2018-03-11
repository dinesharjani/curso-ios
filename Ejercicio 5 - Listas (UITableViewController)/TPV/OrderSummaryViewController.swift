//
//  OrderSummaryViewController.swift
//  TPV
//
//  Created by Dinesh Harjani on 10/03/2018.
//  Copyright © 2018 Dinesh Harjani. All rights reserved.
//

import UIKit

class OrderSummaryViewController: UIViewController, UITableViewDataSource {
    
    private struct Constants {
        static let cellIdentifier = "MyIdentifier"
    }
    
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
        
        summaryTableView.dataSource = self
    }
    
    @objc func onViewControllerTapped(_ sender: Any?) {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: UITableViewDataSourceDelegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard order != nil else {
            return 0
        }
        
        return order!.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: Constants.cellIdentifier)
        }
        
        cell?.textLabel?.text = order!.item(atIndex: indexPath.row)
        
        return cell!
    }
}
