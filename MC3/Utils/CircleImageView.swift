//
//  BackgroundStatusAnimalInfoImageView.swift
//  MC3
//
//  Created by Arif Luthfiansyah on 01/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import Foundation
import UIKit


@IBDesignable
public class BackgroundStatusAnimalInfoImageView: UIImageView {

    override public  func layoutSubviews() {
        super.layoutSubviews()
        guard self.frame.width == self.frame.height else {
            NSLog("Ended up with a non-square frame -- so it may not be a circle")
            return
        }
        self.layer.cornerRadius = self.frame.width / 2
        self.layer.borderColor = #colorLiteral(red: 0.2549999952, green: 0.2199999988, blue: 0.2039999962, alpha: 1)
        self.layer.borderWidth = 5
        self.layer.masksToBounds = true
    }

}
