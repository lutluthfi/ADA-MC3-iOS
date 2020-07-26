//
//  MenuMainGardenCollectionViewCell.swift
//  MC3
//
//  Created by Arif Luthfiansyah on 25/07/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

extension MenuMainGardenCollectionViewCell {

    struct Model {

        enum Menu: CaseIterable {
            case animalRoom
            case inventory
            case reward
            case setting
            case shop
        }

        let menu: MenuMainGardenCollectionViewCell.Model.Menu

    }

}

extension MenuMainGardenCollectionViewCell {

    struct Constant {

        static let kIconImageViewConstraintSize = CGFloat(30)
        static let kIconImageViewCornerRadius = CGFloat(5)
        static let kIconImageViewBorderWidth = CGFloat(3)

    }

}

class MenuMainGardenCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: MenuMainGardenCollectionViewCell.self)
    static let size = CGFloat(40)

    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.implementComponentView()
        self.setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.iconImageView.image = nil
    }

}

// MARK: - Private Function
extension MenuMainGardenCollectionViewCell {

    private func implementComponentView() {
        self.contentView.layoutIfNeeded()
        self.contentView.addSubview(self.iconImageView)
        NSLayoutConstraint.activate([
            self.iconImageView
                .heightAnchor
                .constraint(
                    equalToConstant: MenuMainGardenCollectionViewCell
                        .Constant
                        .kIconImageViewConstraintSize
            ),
            self.iconImageView
                .widthAnchor
                .constraint(
                    equalToConstant: MenuMainGardenCollectionViewCell
                        .Constant
                        .kIconImageViewConstraintSize
            ),
            self.iconImageView
                .centerYAnchor
                .constraint(equalTo: self.contentView.centerYAnchor),
            self.iconImageView
                .centerXAnchor
                .constraint(equalTo: self.contentView.centerXAnchor)
        ])
        self.contentView.layoutIfNeeded()
    }

    private func setupView() {
        self.contentView.backgroundColor = .white
        self.contentView.layer.borderColor = #colorLiteral(red: 0.2549999952, green: 0.2199999988, blue: 0.2039999962, alpha: 1)
        self.contentView.layer.borderWidth = MenuMainGardenCollectionViewCell
            .Constant
            .kIconImageViewBorderWidth
        self.contentView.layer.cornerRadius = MenuMainGardenCollectionViewCell
            .Constant
            .kIconImageViewCornerRadius
    }

}


// MARK: - Public Function
extension MenuMainGardenCollectionViewCell {

    public func fill(withModel model: MenuMainGardenCollectionViewCell.Model) {
        switch model.menu {
        case .animalRoom:
            self.iconImageView.image = UIImage(systemName: "sparkles")
            self.iconImageView.tintColor = #colorLiteral(red: 0.9959999919, green: 0.7609999776, blue: 0.3100000024, alpha: 1)
            break
        case .inventory:
            self.iconImageView.image = UIImage(systemName: "cube.box.fill")
            self.iconImageView.tintColor = #colorLiteral(red: 0.7609999776, green: 0.6000000238, blue: 0.4079999924, alpha: 1)
            break
        case .reward:
            self.iconImageView.image = UIImage(systemName: "gift.fill")
            self.iconImageView.tintColor = #colorLiteral(red: 0.3764705882, green: 0.5725490196, blue: 0.3490196078, alpha: 1)
            break
        case .setting:
            self.iconImageView.image = UIImage(systemName: "gear")
            self.iconImageView.tintColor = #colorLiteral(red: 0.4550000131, green: 0.4550000131, blue: 0.4550000131, alpha: 1)
            break
        case .shop:
            self.iconImageView.image = UIImage(systemName: "cart.fill")
            self.iconImageView.tintColor = #colorLiteral(red: 0.768627451, green: 0.3921568627, blue: 0.3058823529, alpha: 1)
            break
        }
    }

}
