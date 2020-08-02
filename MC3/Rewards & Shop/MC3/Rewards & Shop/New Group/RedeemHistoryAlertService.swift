//
//  RedeemHistoryAlertService.swift
//  MC3
//
//  Created by Antonius F Aulia on 01/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class RedeemHistoryAlertService {
    func alert() -> RedeemHistoryAlertViewController {
        let storyboard = UIStoryboard(name: "RewardBuyStoryboard", bundle: .main)
        
        let alertVC = storyboard.instantiateViewController(withIdentifier: "RedeemHistoryAlertVC") as! RedeemHistoryAlertViewController
        
        return alertVC
    }
}

