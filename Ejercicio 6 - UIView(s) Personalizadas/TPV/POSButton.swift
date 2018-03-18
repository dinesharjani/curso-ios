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

    @IBOutlet private var contentView: UIView!
    
    @IBOutlet private weak var counterLabel: UILabel! {
        didSet {
            units = 0
        }
    }
    
    @IBOutlet private weak var mainLabel: UILabel! {
        didSet {
            text = "🍿"
        }
    }
    
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "POSButton", bundle: bundle)
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        contentView.autoresizingMask = [UIViewAutoresizing.flexibleWidth, .flexibleHeight]
        
        addSubview(contentView)
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onButtonTapped(_:)))
        addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func onButtonTapped(_ sender: Any) {
        units += 1
    }
    
    func resetUnits() {
        units = 0
    }
}
