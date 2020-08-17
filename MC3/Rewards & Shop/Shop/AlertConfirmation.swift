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
    
    @IBOutlet weak var confirmationText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemPrice = newSelectedItem!.price as Int
        itemCategory = category
        confirmationText.text = "Buy 1 \(itemCategory) for $\(itemPrice ?? 0)"
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        switch sender.currentTitle {
        case "No":
            dismiss(animated: true, completion: nil)
        default:
            if rewardsValue < itemPrice! {
                let alert = UIAlertController(title: "Insufficient Balance", message: "You are running out of coins. Play with your cat to get more coins", preferredStyle: .alert)
                let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
                alert.addAction(ok)
                present(alert, animated: true)

            } else {
                rewardsValue -= itemPrice!
                settingsDefaults.set(rewardsValue, forKey: Keys.rewards)
                performSegue(withIdentifier: "unwindToNewShopVC", sender: self)
            }
        }
    }
    

}
