//
//  CustomButton.swift
//  MC3
//
//  Created by Jeremy Jason on 22/07/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class CustomButton: UIButton{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    func setupButton(){
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont(name: "Arial", size: 18)
        layer.cornerRadius = 10
        backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2196078431, blue: 0.2039215686, alpha: 1)
    }
}
