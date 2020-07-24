//
//  AgreementViewController.swift
//  MC3
//
//  Created by Arif Luthfiansyah on 17/07/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class AgreementViewController: UIViewController {

    static let identifier = String(describing: AgreementViewController.self)

    @IBOutlet weak var contentAgreementLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewDidLoad()
    }

    private func setupViewDidLoad() {
        self.contentAgreementLabel.text = "Welcome to Game Title! In order to have a happily ever after garden, please pledge to these following five of freedom principles regarding animal welfare.\n\nFreedom from hunger & thirst (food and water)\nFreedom from discomfort (shelter)\nFreedom from pain, injury & disease (medical care)\nFreedom to express normal behaviour (exercise)\nFreedom from fear & distress (love and understanding)"
        self.startButton.layer.cornerRadius = 5
        self.startButton.addTarget(self, action: #selector(self.onStartButtonTouchedUpInside(_:)), for: .touchUpInside)
    }

}

// MARK: - @objc Function
extension AgreementViewController {

    @objc private func onStartButtonTouchedUpInside(_ sender: UIButton) {
    }

}

// MARK: - Route Function
extension AgreementViewController {

}
