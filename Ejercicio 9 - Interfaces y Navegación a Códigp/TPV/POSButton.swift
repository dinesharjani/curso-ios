//
//  POSButton.swift
//  TPV
//
//  Created by Dinesh Harjani on 12/03/2018.
//  Copyright © 2018 Dinesh Harjani. All rights reserved.
//

import UIKit

@IBDesignable
class POSButton: UIView {

    private lazy var counterLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        label.textAlignment = .center
        label.font = label.font.withSize(23)
        label.text = "0"
        return label
    }()
    
    private lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        label.textAlignment = .center
        label.font = label.font.withSize(55)
        return label
    }()
    
    private (set) var units = 0 {
        didSet {
            counterLabel.text = "\(units)"
        }
    }
    
    @IBInspectable var text: String = "" {
        didSet {
            mainLabel.text = text
        }
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onButtonTapped(_:)))
        addGestureRecognizer(tapGestureRecognizer)
        
        let views = [mainLabel, counterLabel]
        for view in views {
            view.translatesAutoresizingMaskIntoConstraints = false
            addSubview(view)
        }
        
        let mainLabelWidthConstraint = mainLabel.widthAnchor.constraint(equalToConstant: 92)
        mainLabelWidthConstraint.priority = .defaultHigh
        
        let constraints = [
            mainLabelWidthConstraint,
            mainLabel.heightAnchor.constraint(equalTo: mainLabel.widthAnchor, multiplier: 1.0),
            mainLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            mainLabel.topAnchor.constraintGreaterThanOrEqualToSystemSpacingBelow(topAnchor, multiplier: 1.0),
            mainLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -8.0),
            
            counterLabel.heightAnchor.constraint(equalTo: counterLabel.widthAnchor, multiplier: 1.0),
            counterLabel.widthAnchor.constraint(equalTo: mainLabel.heightAnchor, multiplier: 0.375),
            counterLabel.topAnchor.constraint(equalTo: mainLabel.topAnchor, constant: -8.0),
            counterLabel.trailingAnchor.constraint(equalTo: mainLabel.trailingAnchor, constant: 8.0)
        ].flatMap({$0})
        
        NSLayoutConstraint.activate(constraints)
    }
    
    @objc private func onButtonTapped(_ sender: Any) {
        units += 1
        
        UIView.animate(withDuration: 0.15, delay: 0, options: [.autoreverse], animations: {
            self.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.mainLabel.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }) { (completed) in
            if completed {
                self.transform = CGAffineTransform.identity
                self.mainLabel.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    func resetUnits() {
        units = 0
    }
}
