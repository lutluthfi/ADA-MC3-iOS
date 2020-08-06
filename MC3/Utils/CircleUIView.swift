//
//  CircleView.swift
//  MC3
//
//  Created by Arif Luthfiansyah on 01/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
public class CircleView: UIView {

    override public  func layoutSubviews() {
        super.layoutSubviews()
        guard self.frame.width == self.frame.height else {
            NSLog("Ended up with a non-square frame -- so it may not be a circle")
            return
        }
        self.layer.cornerRadius = self.frame.width / 2
        self.layer.masksToBounds = true
    }

}
