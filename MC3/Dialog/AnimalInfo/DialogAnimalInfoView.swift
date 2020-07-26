//
//  DialogAnimalInfoView.swift
//  MC3
//
//  Created by Arif Luthfiansyah on 26/07/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

protocol DialogAnimalInfoViewDelegate: class {

    func dialogAnimalInfoView(_ view: UIView, didConfirm name: String)

}

extension DialogAnimalInfoView {

    struct Constant {

        static let kDialogAnimalInfoViewCornerRadius = CGFloat(10)
        static let kDialogAnimalInfoViewHeight = CGFloat(278)
        static let kDialogAnimalInfoViewWidth = CGFloat(367)
        static let kConfirmButtonCornerRadius = CGFloat(5)
        static let kNameTextFieldBorderColor = #colorLiteral(red: 0.2549999952, green: 0.2199999988, blue: 0.2039999962, alpha: 1)
        static let kNameTextFieldBorderWidth = CGFloat(3)
        static let kNameTextFieldCornerRadius = CGFloat(5)

    }

}

class DialogAnimalInfoView: UIView {

    static let identifier = String(describing: DialogAnimalInfoView.self)

    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var nameFakeTextFieldView: FakeTextFieldView!
    @IBOutlet weak var photoImageView: UIImageView!

    lazy var textFieldInputAccessoryView: TextFieldInputAccessoryView = {
        let view = TextFieldInputAccessoryView()
        view.textField.delegate = self
        view.doneButton.addTarget(
            self,
            action: #selector(self.onDoneButtonTextFieldInputAccessoryViewTouchedUpInside(_:)),
            for: .touchUpInside
        )
        return view
    }()

    private var superView: UIView?
    weak var delegate: DialogAnimalInfoViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        if let superView = self.initialization() {
            superView.frame = self.bounds
            self.superView = superView
            self.addSubview(superView)
            self.setupView()
        }
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        if let superView = self.initialization() {
            superView.frame = self.bounds
            self.superView = superView
            self.addSubview(superView)
            self.setupView()
        }
    }

    private func initialization() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }

    private func setupView() {
        self.superView?.layer.cornerRadius = Constant.kDialogAnimalInfoViewCornerRadius
        self.confirmButton.layer.cornerRadius = Constant.kConfirmButtonCornerRadius
        self.confirmButton.addTarget(
            self,
            action: #selector(self.onConfirmButtonTouchedUpInside(_:)),
            for: .touchUpInside
        )
        self.nameFakeTextFieldView.layer.cornerRadius = 5
        self.nameFakeTextFieldView.layer.borderColor = #colorLiteral(red: 0.2549999952, green: 0.2199999988, blue: 0.2039999962, alpha: 1)
        self.nameFakeTextFieldView.layer.borderWidth = 3
        self.nameFakeTextFieldView.layer.masksToBounds = true
        self.nameFakeTextFieldView.textLabel.font = UIFont(name: "Happy Monkey", size: 17)
        self.nameFakeTextFieldView.textLabel.text = "Guest"
        self.nameFakeTextFieldView.inputAccessoryView = self.textFieldInputAccessoryView
    }
    
}

// MARK: - @objc Function
extension DialogAnimalInfoView {

    @objc private func onConfirmButtonTouchedUpInside(_ sender: UIButton) {
        let text = self.nameFakeTextFieldView.textLabel.text ?? "Guest"
        if let superView = self.superView {
            self.delegate?.dialogAnimalInfoView(superView, didConfirm: text)
        }
    }

    @objc private func onDoneButtonTextFieldInputAccessoryViewTouchedUpInside(
        _ sender: UIButton
    ) {
        let textField = (self.nameFakeTextFieldView.inputAccessoryView as? TextFieldInputAccessoryView)?
            .textField
        textField?.resignFirstResponder()
        self.nameFakeTextFieldView.resignFirstResponder()
        self.nameFakeTextFieldView.textLabel.text = textField?.text?.isEmpty ?? true ?
            "Guest" : textField?.text
    }

}

// MARK: - UITextFieldDelegate Function
extension DialogAnimalInfoView: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.textFieldInputAccessoryView
            .subviews
            .filter({ $0 is UITextField })
            .first {
            textField.resignFirstResponder()
            self.nameFakeTextFieldView.textLabel.text = textField.text?.isEmpty ?? true ?
                "Guest" : textField.text
        }
        return true
    }

    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        return true
    }

}
