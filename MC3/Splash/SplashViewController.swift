//
//  SplashViewController.swift
//  MC3
//
//  Created by Arif Luthfiansyah on 16/07/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

extension SplashViewController {

    struct ConstraintConstant {

        static let kHeightLogoImageViewConstraint = CGFloat(158)
        static let kWidthLogoImageViewConstraint = CGFloat(158)

    }

}

class SplashViewController: UIViewController {

    static let identifier = String(describing: SplashViewController.self)

    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .gray
        return imageView
    }()

    // MARK: - Lifecycle Function
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewDidLoad()
    }

    private func setupViewDidLoad() {
        self.implementComponentView()
        self.view.backgroundColor = #colorLiteral(red: 1, green: 0.976000011, blue: 0.949000001, alpha: 1)
        let logoImageViewCorner = self.logoImageView.frame.height / 2
        self.logoImageView.layer.cornerRadius = logoImageViewCorner
    }

}

// MARK: - Override UIViewController
extension SplashViewController {

    override var prefersStatusBarHidden: Bool {
        return true
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

}

// MARK: - Implement Component View Function
extension SplashViewController {

    private func implementComponentView() {
        self.view.addSubview(self.logoImageView)
        let heightLogoImageViewConstraint = self.logoImageView
            .heightAnchor
            .constraint(equalToConstant: ConstraintConstant.kHeightLogoImageViewConstraint)
        let widthLogoImageViewConstraint = self.logoImageView
            .widthAnchor
            .constraint(equalToConstant: ConstraintConstant.kWidthLogoImageViewConstraint)
        let centerXLogoImageViewConstraint = self.logoImageView
            .centerXAnchor
            .constraint(equalTo: self.view.centerXAnchor)
        let centerYLogoImageViewConstraint = self.logoImageView
            .centerYAnchor
            .constraint(equalTo: self.view.centerYAnchor)
        NSLayoutConstraint.activate([
            heightLogoImageViewConstraint,
            widthLogoImageViewConstraint,
            centerXLogoImageViewConstraint,
            centerYLogoImageViewConstraint
        ])
        self.view.layoutIfNeeded()
    }

}
