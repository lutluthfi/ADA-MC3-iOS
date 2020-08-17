//
//  AlertConfirmation.swift
//  MC3
//
//  Created by Muhammad Faruuq Qayyum on 17/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class AlertConfirmation: UIViewController {
    
    var itemPrice: Int?
    var itemCategory: String = ""
    var currentRewardsValue: Int = 0
    
    @IBOutlet weak var confirmationText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentRewardsValue = settingsDefaults.integer(forKey: Keys.rewards)
        
        itemPrice = newSelectedItem!.price as Int
        itemCategory = category
        confirmationText.text = "Buy 1 \(itemCategory) for $\(itemPrice ?? 0)"
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        switch sender.currentTitle {
        case "No":
            dismiss(animated: true, completion: nil)
        default:
            break
        }
    }
    

}
