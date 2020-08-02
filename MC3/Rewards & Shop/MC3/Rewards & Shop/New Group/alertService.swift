//
//  alertService.swift
//  MC3
//
//  Created by Antonius F Aulia on 30/07/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class alertService {
    func alert() -> RewardBuyAlertViewController {
        let storyboard = UIStoryboard(name: "RewardBuyStoryboard", bundle: .main)
        
        let alertVC = storyboard.instantiateViewController(withIdentifier: "RewardBuyAlertVC") as! RewardBuyAlertViewController
        
        return alertVC
    }
}
