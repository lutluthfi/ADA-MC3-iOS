//
//  MCTransitionAnimator.swift
//  MC3
//
//  Created by Arif Luthfiansyah on 21/07/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import Foundation
import UIKit

final class MCTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {

    static let kSecondTransitionDuration = TimeInterval(0.75)

    private let circleOrigin: CGPoint = {
        let centerX = UIScreen.main.bounds.width * 0.5
        let centerY = UIScreen.main.bounds.height * 0.5
        return CGPoint(x: centerX, y: centerY)
    }()
    private let presenting: Bool
    private var transitionContext: UIViewControllerContextTransitioning?

    init(presenting: Bool) {
        self.presenting = presenting
    }

    func transitionDuration(
        using transitionContext: UIViewControllerContextTransitioning?
    ) -> TimeInterval {
        return MCTransitionAnimator.kSecondTransitionDuration
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        self.transitionContext = transitionContext
        guard let fromView = transitionContext.view(forKey: .from),
            let toView = transitionContext.view(forKey: .to)
            else { return }
        let duration = self.transitionDuration(using: transitionContext)
        let containerView = transitionContext.containerView
        self.presenting ?
            containerView.addSubview(toView) :
            containerView.insertSubview(toView, belowSubview: fromView)
        // Use the following code to add circle ease out animation
        // let paths = self.getStartEndPath()
        // let maskCircleLayer = CAShapeLayer()
        // maskCircleLayer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        // maskCircleLayer.position = self.circleOrigin
        // maskCircleLayer.path = paths.start
        if self.presenting {
            toView.alpha = 0
        }
        let animations = {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1.0) {
                if self.presenting {
                    toView.alpha = 1
                } else {
                    fromView.alpha = 0
                }
            }
        }
        UIView.animateKeyframes(
            withDuration: duration,
            delay: 0,
            options: .calculationModeCubic,
            animations: animations,
            completion: { finished in
                containerView.addSubview(toView)
                transitionContext.completeTransition(
                    !transitionContext.transitionWasCancelled
                )
        })
    }

    private func scalingAnimation(destinationPath: CGPath) -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "path")
        animation.toValue = destinationPath
        animation.isRemovedOnCompletion = false
        animation.fillMode = CAMediaTimingFillMode.both
        animation.duration = MCTransitionAnimator.kSecondTransitionDuration
        animation.timingFunction = CAMediaTimingFunction(
            name: CAMediaTimingFunctionName.easeOut
        )
        animation.delegate = self
        return animation
    }

    private func getStartEndPath() -> (start: CGPath, end: CGPath) {
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        let rw = width + abs(width / 2 - self.circleOrigin.x)
        let rh = height + abs(height / 2 - self.circleOrigin.y)
        let h1 = hypot(width / 2 - self.circleOrigin.x, height/2 - self.circleOrigin.y)
        let hyp = CGFloat(sqrtf(powf(Float(rw), 2) + powf(Float(rh), 2)))
        let dia = h1 + hyp
        let path1 = UIBezierPath(ovalIn: CGRect.zero).cgPath
        let path2 = UIBezierPath(ovalIn: CGRect(x: -dia / 2, y: -dia / 2, width: dia, height: dia)).cgPath
        return self.presenting ? (path1, path2) : (path2, path1)
    }

}

extension MCTransitionAnimator: CAAnimationDelegate {

    func animationDidStart(_ anim: CAAnimation) {

    }

    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
    }

    func animationEnded(_ transitionCompleted: Bool) {
    }

}
