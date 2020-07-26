//
//  UIView+Keyboard.swift
//  MC3
//
//  Created by Arif Luthfiansyah on 26/07/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {

    func activateDismissKeyboardTapGestureRecognizer(on view: UIView? = nil) {
        let tap = UITapGestureRecognizer(
            target: self,
            action: #selector(self.onDismissKeyboardGestureTapped)
        )
        tap.cancelsTouchesInView = false
        view == nil ?
            self.view.addGestureRecognizer(tap) :
            view?.addGestureRecognizer(tap)
    }

    @objc func onDismissKeyboardGestureTapped() {
        self.view.endEditing(true)
    }

}
