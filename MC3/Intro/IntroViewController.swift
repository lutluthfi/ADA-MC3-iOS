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
    }

    private func setupViewDidLoad() {
        self.startButton.layer.cornerRadius = 5
        self.startButton.addTarget(self, action: #selector(self.onStartButtonTouchedUpInside(_:)), for: .touchUpInside)
    }

    // MARK: - @objc Function
    @objc private func onStartButtonTouchedUpInside(_ sender: UIButton) {

    }

}
