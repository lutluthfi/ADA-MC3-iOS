//
//  FakeTextFieldView.swift
//  MC3
//
//  Created by Arif Luthfiansyah on 26/07/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import Foundation
import UIKit

class FakeTextFieldView: UIView {

    private var _inputAccessoryView: UIView?
    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var tapGestureRecognizer = UITapGestureRecognizer(
        target: self, action: #selector(self.onTapped(_:))
    )

    override var canBecomeFirstResponder: Bool { return true }
    override var canResignFirstResponder: Bool { return true }

    override var inputAccessoryView: UIView? {
        set { self._inputAccessoryView = newValue }
        get { return self._inputAccessoryView }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.implementComponentView()
        self.setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.implementComponentView()
        self.setupView()
    }

    private func implementComponentView() {
        self.addSubview(self.textLabel)
        NSLayoutConstraint.activate([
            self.textLabel
                .centerYAnchor
                .constraint(equalTo: self.centerYAnchor),
            self.textLabel
                .centerXAnchor
                .constraint(equalTo: self.centerXAnchor)
        ])
    }

    private func setupView() {
        self.isUserInteractionEnabled = true
        self.gestureRecognizers = [ self.tapGestureRecognizer ]
    }

}

extension FakeTextFieldView {

    @objc private func onTapped(_ sender: UITapGestureRecognizer) {
        self.becomeFirstResponder()
    }

}
