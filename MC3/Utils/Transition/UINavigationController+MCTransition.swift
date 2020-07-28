//
//  UINavigationController+MCTransition.swift
//  MC3
//
//  Created by Arif Luthfiansyah on 21/07/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationController {
    
    static private var kCoordinatorHelperKey = "UINavigationController.MCTransitionCoordinatorHelper"
    
    var transitionCoordinatorHelper: MCTransitionCoordinator? {
        return objc_getAssociatedObject(self, &UINavigationController.kCoordinatorHelperKey) as? MCTransitionCoordinator
    }
    
    func enableMCTransitioning() {
        var object = objc_getAssociatedObject(self, &UINavigationController.kCoordinatorHelperKey)
        guard object == nil else {
            return
        }
        object = MCTransitionCoordinator()
        let nonatomic = objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC
        objc_setAssociatedObject(
            self,
            &UINavigationController.kCoordinatorHelperKey,
            object, nonatomic
        )
        self.delegate = object as? MCTransitionCoordinator
        // Uncomment the following code to enable swipe back gesture to pop
        // let edgePanGestureRecognizer = UIScreenEdgePanGestureRecognizer(
        //     target: self,
        //     action: #selector(self.onEdgeViewPanned(_:))
        // )
        // edgePanGestureRecognizer.edges = .left
        // self.view.addGestureRecognizer(edgePanGestureRecognizer)
    }
    
    @objc func onEdgeViewPanned(_ sender: UIScreenEdgePanGestureRecognizer) {
        guard let gestureRecognizerView = sender.view else {
            self.transitionCoordinatorHelper?.interactionController = nil
            return
        }
        let percent = sender.translation(in: gestureRecognizerView).x /
            gestureRecognizerView.bounds.size.width
        if sender.state == .began {
            self.transitionCoordinatorHelper?.interactionController = UIPercentDrivenInteractiveTransition()
            self.popViewController(animated: true)
        } else if sender.state == .changed {
            self.transitionCoordinatorHelper?.interactionController?.update(percent)
        } else if sender.state == .ended {
            if percent > 0.5 && sender.state != .cancelled {
                self.transitionCoordinatorHelper?.interactionController?.finish()
            } else {
                self.transitionCoordinatorHelper?.interactionController?.cancel()
            }
            self.transitionCoordinatorHelper?.interactionController = nil
        }
    }
    
}

