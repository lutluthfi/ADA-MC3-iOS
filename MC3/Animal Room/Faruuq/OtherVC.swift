//
//  OtherVC.swift
//  MC3
//
//  Created by Muhammad Faruuq Qayyum on 24/07/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class OtherVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemOrange
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapDismiss))
        view.addGestureRecognizer(tap)
        
    }
    
    @objc func tapDismiss(sender: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    

}
