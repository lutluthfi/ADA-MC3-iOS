//
//  UIButton+Extension.swift
//  MC3
//
//  Created by Rahmat Zulfikri on 03/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        soundManager.play(soundType: .button)
    }
}
