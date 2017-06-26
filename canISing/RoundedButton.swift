//
//  RoundedButton.swift
//  canISing
//
//  Created by woroninb on 15/06/2017.
//  Copyright © 2017 com.roche. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.borderWidth = 1.0
        layer.borderColor = tintColor.cgColor
        layer.cornerRadius = 5.0
        clipsToBounds = true
        contentEdgeInsets = UIEdgeInsets(top: 8, left: 15, bottom: 8, right: 15)
        
        titleLabel?.font = UIFont(name: "HelveticaNeue-Light", size: 16)
        setTitleColor(tintColor, for: .normal)
        setTitleColor(tintColor.withAlphaComponent(0.7), for: .highlighted)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
