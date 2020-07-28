//
//  MCTransitionCoordinator.swift
//  MC3
//
//  Created by Arif Luthfiansyah on 21/07/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import Foundation
import UIKit

final class MCTransitionCoordinator: NSObject, UINavigationControllerDelegate {

    var interactionController: UIPercentDrivenInteractiveTransition?

    func navigationController(
        _ navigationController: UINavigationController,
        animationControllerFor operation: UINavigationController.Operation,
        from fromVC: UIViewController,
        to toVC: UIViewController
    ) -> UIViewControllerAnimatedTransitioning? {
        switch operation {
        case .push:
            return MCTransitionAnimator(presenting: true)
        case .pop:
            return MCTransitionAnimator(presenting: false)
        default:
            return nil
        }
    }

    func navigationController(
        _ navigationController: UINavigationController,
        interactionControllerFor animationController: UIViewControllerAnimatedTransitioning
    ) -> UIViewControllerInteractiveTransitioning? {
        return self.interactionController
    }

}
