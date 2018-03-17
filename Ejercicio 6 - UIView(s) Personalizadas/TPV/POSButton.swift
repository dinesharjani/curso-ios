//
//  POSButton.swift
//  TPV
//
//  Created by Dinesh Harjani on 12/03/2018.
//  Copyright © 2018 Dinesh Harjani. All rights reserved.
//

import UIKit

class POSButton: UIView {

    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var counterLabel: UILabel!
    
    @IBOutlet weak var mainLabel: UILabel!
    
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
}
