//
//  ShopAlertService.swift
//  MC3
//
//  Created by Antonius F Aulia on 02/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class ShopAlertService {
    func alert() -> ShopAlertViewController {
        let storyboard = UIStoryboard(name: "ShopAlertStoryboard", bundle: .main)
        
        let alertVC = storyboard.instantiateViewController(withIdentifier: "ShopAlertVC") as! ShopAlertViewController
        
        return alertVC
    }
}
