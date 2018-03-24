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
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "POSButton", bundle: bundle)
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        contentView.autoresizingMask = [UIViewAutoresizing.flexibleWidth, .flexibleHeight]
        
        addSubview(contentView)
    }
    
    @IBAction func onButtonTapped(_ sender: Any) {
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
