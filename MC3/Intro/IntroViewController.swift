//
//  IntroViewController.swift
//  MC3
//
//  Created by Arif Luthfiansyah on 16/07/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {

    static let identifier = String(describing: IntroViewController.self)

    // MARK: - @IBOutlet
    @IBOutlet weak var startButton: UIButton!

    // MARK: - Lifecycle Function
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewDidLoad()
    }

    private func setupViewDidLoad() {
        self.startButton.layer.cornerRadius = 5
        self.startButton.addTarget(self, action: #selector(self.onStartButtonTouchedUpInside(_:)), for: .touchUpInside)
    }

}

// MARK: - @objc Function
extension IntroViewController {

    @objc private func onStartButtonTouchedUpInside(_ sender: UIButton) {
        settingsDefaults.set(true, forKey: Keys.isStartGame)
        let isAgree = settingsDefaults.bool(forKey: Keys.isAgree)
        if (isAgree) {
            self.startMainGardenScene()
        } else {
            self.startAgreementScene()
        }
    }

}

// MARK: - Route Function
extension IntroViewController {

    private func startAgreementScene() {
        let storyboard = UIStoryboard(name: AgreementViewController.identifier, bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: AgreementViewController.identifier)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func startMainGardenScene() {
        let storyboard = UIStoryboard(name: MainGardenViewController.identifier, bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: MainGardenViewController.identifier)
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
