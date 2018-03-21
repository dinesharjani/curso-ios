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
    
    // MARK: Properties & Outlets
    
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
    
    @IBOutlet weak var emptyOrderLabel: UILabel!
    
    public var order: Order?
    
    // MARK: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Resumen"
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onViewControllerTapped(_:))))
        
        summaryTableView.dataSource = self
        // Removes empty UITableViewCell(s).
        summaryTableView.tableFooterView = UIView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        guard order != nil else {
            UIView.animate(withDuration: 0.5, animations: {
                self.emptyOrderLabel.isHidden = false
            })
            return
        }
        
        let startingFrame = summaryTableView.frame
        let originBelowScreen = CGPoint(x: 0, y: summaryTableView.frame.origin.y + view.bounds.size.height)
        summaryTableView.frame = CGRect(origin: originBelowScreen, size: summaryTableView.bounds.size)
        summaryTableView.isHidden = false
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.summaryTableView.frame = startingFrame
        }, completion: nil)
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
        
        let orderItem = order!.item(atIndex: indexPath.row)
        cell?.textLabel?.text = "\(orderItem.units) x \(orderItem.description) = \(orderItem.price.description)"
        
        return cell!
    }
}
