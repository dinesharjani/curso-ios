//
//  POSViewController.swift
//  TPV
//
//  Created by Dinesh Harjani on 03/03/2018.
//  Copyright © 2018 Dinesh Harjani. All rights reserved.
//

import UIKit

class POSViewController: UIViewController {
    
    // MARK: Private Structures / Classes
    
    private struct Constants {
        static let burgersLabelIndex = 0
        static let friesLabelIndex = 1
        static let iceCreamLabelIndex = 2
        
        static let labels = ["🍔", "🍟", "🍦"]
    }
    
    // MARK: Properties
    
    private lazy var headerImageView = UIImageView()
    
    private lazy var dateLabel = UILabel()
    
    private lazy var posButtonCollection: [POSButton] = {
        var collection = [POSButton]()
        for _ in Constants.labels {
            collection.append(POSButton())
        }
        return collection
    }()
    
    private var hamburguesas: Int {
        get {
            return posButtonCollection[Constants.burgersLabelIndex].units
        }
    }
    
    private var papasFritas: Int {
        get {
            return posButtonCollection[Constants.friesLabelIndex].units
        }
    }
    
    private var helados: Int {
        get {
            return posButtonCollection[Constants.iceCreamLabelIndex].units
        }
    }
    
    private var numberOfItemsInOrder: Int {
        get {
            return hamburguesas + papasFritas + helados
        }
    }
    
    private var orders = [Order]()
    
    // MARK: UIViewController Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = NSLocalizedString("vc.pos.title", comment: "")
        view.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        
        installConstraints()
        setupViews()
    }
    
    private func installConstraints() {
        let views = [
            headerImageView, dateLabel
        ] as [UIView]
        
        for subview in views {
            view.addSubview(subview)
            subview.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let constraints = [
            headerImageView.topAnchor.constraintEqualToSystemSpacingBelow(view.safeAreaLayoutGuide.topAnchor, multiplier: 1.0),
            headerImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8.0),
            headerImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8.0),
            headerImageView.heightAnchor.constraint(equalToConstant: 65),
            headerImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            dateLabel.topAnchor.constraintEqualToSystemSpacingBelow(headerImageView.bottomAnchor, multiplier: 1.0),
            dateLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
        ].flatMap({$0})
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupViews() {
        headerImageView.contentMode = .scaleAspectFill
        headerImageView.image = UIImage(named: "header")
        headerImageView.clipsToBounds = true
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        dateLabel.text = dateFormatter.string(from: Date())
        
        for buttonIndex in posButtonCollection.indices {
            posButtonCollection[buttonIndex].text = Constants.labels[buttonIndex]
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier == "showSummary", let summaryViewController = segue.destination as? OrderSummaryViewController {
            summaryViewController.order = Order(hamburgers: hamburguesas, fries: papasFritas, iceCream: helados)
        }
    }
    
    // MARK: Private Functions
    
    @IBAction private func newOrderWasTapped(_ sender: UIButton) {
        if let newOrder = Order(hamburgers: hamburguesas, fries: papasFritas, iceCream: helados) {
            orders.append(newOrder)
            print("\(newOrder.price)")
        }
        
        for posButton in posButtonCollection {
            posButton.resetUnits()
        }
    }
}

