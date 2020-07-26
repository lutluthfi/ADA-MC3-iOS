//
//  TextFieldInputAccessoryView.swift
//  MC3
//
//  Created by Arif Luthfiansyah on 26/07/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import Foundation
import UIKit

class TextFieldInputAccessoryView: UIView {

    lazy var doneButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        let attributedStringTitle = NSAttributedString(
            string: "Done",
            attributes: [
                .font : UIFont(name: "Happy Monkey", size: 17)!,
                .foregroundColor : UIColor.white
        ])
        button.setAttributedTitle(attributedStringTitle, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.2549999952, green: 0.2199999988, blue: 0.2039999962, alpha: 1)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        return button
    }()
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Name"
        textField.textAlignment = .left
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 5
        textField.layer.masksToBounds = true
        textField.returnKeyType = .done
        textField.font = UIFont(name: "Happy Monkey", size: 17)
        return textField
    }()

    override init(frame: CGRect) {
        let rect = CGRect( x: .zero, y: .zero, width: .zero, height: 60)
        super.init(frame: rect)
        self.implementComponentView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.implementComponentView()
    }

    private func implementComponentView() {
        self.backgroundColor = #colorLiteral(red: 1, green: 0.976000011, blue: 0.949000001, alpha: 1)
        self.addSubview(self.textField)
        self.addSubview(self.doneButton)
        NSLayoutConstraint.activate([
            self.textField
                .leadingAnchor
                .constraint(
                    equalTo: self.safeAreaLayoutGuide.leadingAnchor,
                    constant: 8
            ),
            self.textField
                .topAnchor
                .constraint(equalTo: self.topAnchor, constant: 8),
            self.textField
                .bottomAnchor
                .constraint(equalTo: self.bottomAnchor, constant: -8),
            self.textField
                .trailingAnchor
                .constraint(
                    equalTo: self.doneButton.leadingAnchor,
                    constant: -8
            )
        ])
        NSLayoutConstraint.activate([
            self.doneButton
                .centerYAnchor
                .constraint(equalTo: self.textField.centerYAnchor),
            self.doneButton
                .widthAnchor
                .constraint(equalToConstant: 80),
            self.doneButton
                .trailingAnchor
                .constraint(
                    equalTo: self.safeAreaLayoutGuide.trailingAnchor,
                    constant: -8
            )
        ])
        self.textField.leftView = UIView(frame:
            .init(
                x: .zero,
                y: .zero,
                width: 8,
                height: self.textField.frame.height
            )
        )
        self.textField.leftViewMode = .always
    }

}
