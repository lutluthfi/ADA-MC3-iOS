//
//  MainGardenViewController.swift
//  MC3
//
//  Created by Arif Luthfiansyah on 24/07/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

extension MainGardenViewController {

    struct Constant {

        static let kAllStatusAnimalInfoBackgroundImageViewBorderWidth = CGFloat(5)
        static let kCoinContainerViewBorderWidth = CGFloat(3)
        static let kCoinContainerViewCornerRadius = CGFloat(5)
        static let kHideCenterYPetAnimalInfoImageViewConstraint = CGFloat(150)
        static let kHideLeadingAllStatusAnimalInfoContainerViewConstraint = CGFloat(-150)
        static let kPetMaxYPosition = CGFloat(200)
        static let kPetMinYPosition = CGFloat(295)
        static let kShowCenterYPetAnimalInfoImageViewConstraint = CGFloat(0)
        static let kShowLeadingAllStatusAnimalInfoContainerViewConstraint = CGFloat(200)
        static let kStatusAnimalInfoProgressViewCorner = CGFloat(2)
        static let kStatusAnimalInfoProgressViewTransform = CGAffineTransform(
            scaleX: 1,
            y: 4.5
        )

    }

}

class MainGardenViewController: UIViewController {

    static let identifier = String(describing: MainGardenViewController.self)

    lazy var opaqueView: UIView = {
        let view = UIView()
        view.frame = self.view.frame
        view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        view.gestureRecognizers = [
            UITapGestureRecognizer(
                target: self,
                action: #selector(self.onOpaqueViewTapped(_:))
            )
        ]
        return view
    }()

    @IBOutlet weak var allStatusAnimalInfoContainerView: UIView!
    @IBOutlet weak var allStatusAnimalInfoBackgroundImageView: UIImageView!
    @IBOutlet weak var centerYPetAnimalInfoImageView: NSLayoutConstraint!
    @IBOutlet weak var coinAmountLabel: UILabel!
    @IBOutlet weak var coinContainerView: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var leadingAllStatusAnimalInfoContainerViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var mainGardenBackgroundImageView: UIImageView!
    @IBOutlet weak var menuCollectionView: UICollectionView!
    @IBOutlet weak var petPositionHolderView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var statusFoodIconContainerView: UIView!
    @IBOutlet weak var statusFoodProgressView: UIProgressView!
    @IBOutlet weak var statusHealthIconContainerView: UIView!
    @IBOutlet weak var statusHealthProgressView: UIProgressView!
    @IBOutlet weak var statusPettingIconContainerView: UIView!
    @IBOutlet weak var statusPettingProgressView: UIProgressView!
    @IBOutlet weak var statusPlayIconContainerView: UIView!
    @IBOutlet weak var statusPlayProgressView: UIProgressView!
    @IBOutlet weak var statusSleepIconContainerView: UIView!
    @IBOutlet weak var statusSleepProgressView: UIProgressView!

    private lazy var dialogFactory = DialogFactory()

    private let displayedMenu: [MenuMainGardenCollectionViewCell.Model.Menu] = [
        .setting,
        .reward,
        .shop,
        .inventory,
        .animalRoom
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewDidLoad()
    }

    private func setupViewDidLoad() {
        self.activateDismissKeyboardTapGestureRecognizer()
        self.coinContainerView.layer.cornerRadius = Constant.kCoinContainerViewCornerRadius
        self.coinContainerView.layer.borderColor = #colorLiteral(red: 0.2549999952, green: 0.2199999988, blue: 0.2039999962, alpha: 1)
        self.coinContainerView.layer.borderWidth = Constant.kCoinContainerViewBorderWidth
        self.menuCollectionView.backgroundColor = .clear
        self.menuCollectionView.showsVerticalScrollIndicator = false
        self.menuCollectionView.alwaysBounceVertical = false
        self.menuCollectionView.dataSource = self
        self.menuCollectionView.delegate = self
        self.menuCollectionView.register(
            MenuMainGardenCollectionViewCell.self,
            forCellWithReuseIdentifier: MenuMainGardenCollectionViewCell.identifier
        )
        let allStatusAnimalInfoBackgroundImageViewCorner = self.allStatusAnimalInfoBackgroundImageView.frame.height / 2
        self.allStatusAnimalInfoBackgroundImageView.layer.cornerRadius = allStatusAnimalInfoBackgroundImageViewCorner
        self.allStatusAnimalInfoBackgroundImageView.layer.borderColor = #colorLiteral(red: 0.2549999952, green: 0.2199999988, blue: 0.2039999962, alpha: 1)
        self.allStatusAnimalInfoBackgroundImageView.layer.borderWidth = Constant.kAllStatusAnimalInfoBackgroundImageViewBorderWidth

        let statusFoodIconContainerViewCorner = self.statusFoodIconContainerView.frame.height / 2
        self.statusFoodIconContainerView.layer.cornerRadius = statusFoodIconContainerViewCorner
        self.statusFoodIconContainerView.backgroundColor = #colorLiteral(red: 0.2549999952, green: 0.2199999988, blue: 0.2039999962, alpha: 1)
        if let iconImageView = self.statusFoodIconContainerView
            .subviews
            .filter({ $0 is UIImageView })
            .first as? UIImageView {
            iconImageView.image = iconImageView.image?.withTintColor(.white)
        }

        let statusSleepIconContainerViewCorner = self.statusSleepIconContainerView.frame.height / 2
        self.statusSleepIconContainerView.layer.cornerRadius = statusSleepIconContainerViewCorner
        self.statusSleepIconContainerView.backgroundColor = #colorLiteral(red: 0.2549999952, green: 0.2199999988, blue: 0.2039999962, alpha: 1)
        if let iconImageView = self.statusSleepIconContainerView
            .subviews
            .filter({ $0 is UIImageView })
            .first as? UIImageView {
            iconImageView.image = iconImageView.image?.withTintColor(.white)
        }

        let statusHealthIconContainerViewCorner = self.statusHealthIconContainerView.frame.height / 2
        self.statusHealthIconContainerView.layer.cornerRadius = statusHealthIconContainerViewCorner
        self.statusHealthIconContainerView.backgroundColor = #colorLiteral(red: 0.2549999952, green: 0.2199999988, blue: 0.2039999962, alpha: 1)
        if let iconImageView = self.statusHealthIconContainerView
            .subviews
            .filter({ $0 is UIImageView })
            .first as? UIImageView {
            iconImageView.image = iconImageView.image?.withTintColor(.white)
        }

        let statusPlayIconContainerViewCorner = self.statusPlayIconContainerView.frame.height / 2
        self.statusPlayIconContainerView.layer.cornerRadius = statusPlayIconContainerViewCorner
        self.statusPlayIconContainerView.backgroundColor = #colorLiteral(red: 0.2549999952, green: 0.2199999988, blue: 0.2039999962, alpha: 1)
        if let iconImageView = self.statusPlayIconContainerView
            .subviews
            .filter({ $0 is UIImageView })
            .first as? UIImageView {
            iconImageView.image = iconImageView.image?.withTintColor(.white)
        }

        let statusPettingIconContainerViewCorner = self.statusPettingIconContainerView.frame.height / 2
        self.statusPettingIconContainerView.layer.cornerRadius = statusPettingIconContainerViewCorner
        self.statusPettingIconContainerView.backgroundColor = #colorLiteral(red: 0.2549999952, green: 0.2199999988, blue: 0.2039999962, alpha: 1)
        if let iconImageView = self.statusPettingIconContainerView
            .subviews
            .filter({ $0 is UIImageView })
            .first as? UIImageView {
            iconImageView.image = iconImageView.image?.withTintColor(.white)
        }

        self.statusFoodProgressView.layer.cornerRadius = Constant
            .kStatusAnimalInfoProgressViewCorner
        self.statusFoodProgressView.transform = Constant
            .kStatusAnimalInfoProgressViewTransform

        self.statusSleepProgressView.layer.cornerRadius = Constant
            .kStatusAnimalInfoProgressViewCorner
        self.statusSleepProgressView.transform = Constant
            .kStatusAnimalInfoProgressViewTransform

        self.statusHealthProgressView.layer.cornerRadius = Constant
            .kStatusAnimalInfoProgressViewCorner
        self.statusHealthProgressView.transform = Constant
            .kStatusAnimalInfoProgressViewTransform

        self.statusPlayProgressView.layer.cornerRadius = Constant
            .kStatusAnimalInfoProgressViewCorner
        self.statusPlayProgressView.transform = Constant
            .kStatusAnimalInfoProgressViewTransform

        self.statusPettingProgressView.layer.cornerRadius = Constant
            .kStatusAnimalInfoProgressViewCorner
        self.statusPettingProgressView.transform = Constant
            .kStatusAnimalInfoProgressViewTransform

        self.doGeneratePetImageView()
        //        let dialogId = UUID().uuidString
        //        let dialogScene = DialogFactory
        //            .Scene
        //            .animalInfo(dialogId: dialogId, delegate: nil)
        //        self.dialogFactory.show(scene: dialogScene)
    }

}

// MARK: - @objc Function
extension MainGardenViewController {

    @objc private func onOpaqueViewTapped(_ sender: UITapGestureRecognizer) {
        self.leadingAllStatusAnimalInfoContainerViewConstraint.constant = Constant
            .kHideLeadingAllStatusAnimalInfoContainerViewConstraint
        self.opaqueView.removeFromSuperview()
        UIView.animate(withDuration: 0.75, animations: {
            self.view.layoutIfNeeded()
        }, completion: { (_) in
            self.centerYPetAnimalInfoImageView.constant = Constant
                .kHideCenterYPetAnimalInfoImageViewConstraint
            UIView.animate(withDuration: 0.25, animations: {
                self.view.layoutIfNeeded()
            })
        })
    }

    @objc private func onPetImageViewTapped(_ sender: UITapGestureRecognizer) {
        let isContainerViewShow = self.leadingAllStatusAnimalInfoContainerViewConstraint.constant ==
            Constant.kShowLeadingAllStatusAnimalInfoContainerViewConstraint
        self.leadingAllStatusAnimalInfoContainerViewConstraint.constant = isContainerViewShow ?
            Constant.kHideLeadingAllStatusAnimalInfoContainerViewConstraint :
            Constant.kShowLeadingAllStatusAnimalInfoContainerViewConstraint
        isContainerViewShow ?
            self.opaqueView.removeFromSuperview() :
            self.contentView.insertSubview(
                self.opaqueView,
                aboveSubview: self.mainGardenBackgroundImageView
            )
        UIView.animate(withDuration: 0.75, animations: {
            self.view.layoutIfNeeded()
        }, completion: { (_) in
            self.centerYPetAnimalInfoImageView.constant = isContainerViewShow ?
                Constant.kHideCenterYPetAnimalInfoImageViewConstraint :
                Constant.kShowCenterYPetAnimalInfoImageViewConstraint
            UIView.animate(withDuration: 0.25, animations: {
                self.view.layoutIfNeeded()
            })
        })
    }

}

// MARK: - Private Function
extension MainGardenViewController {

    // Will generate position of pet as much as user have
    private func doGeneratePetImageView() {
        let petImageView = UIImageView()
        let xPositionRange = self.petPositionHolderView.frame.origin.x ..<
            self.petPositionHolderView.frame.width
        let yPositionRange = self.petPositionHolderView.frame.origin.y ..<
            (self.view.frame.height - self.petPositionHolderView.frame.height)
        let xPosition = CGFloat.random(in: xPositionRange)
        let yPosition = CGFloat.random(in: yPositionRange)
        petImageView.frame = .init(x: xPosition, y: yPosition, width: 70, height: 90)
        petImageView.isUserInteractionEnabled = true
        petImageView.image = UIImage(named: "Cat-Normal-1")
        petImageView.gestureRecognizers = [
            UITapGestureRecognizer(
                target: self,
                action: #selector(self.onPetImageViewTapped(_:))
            )
        ]
        self.contentView.addSubview(petImageView)
        self.contentView.bringSubviewToFront(petImageView)
    }

}

// MARK: - UICollectionView Function
extension MainGardenViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return MenuMainGardenCollectionViewCell.Model.Menu.allCases.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let width = MenuMainGardenCollectionViewCell.size
        let height = MenuMainGardenCollectionViewCell.size
        return .init(width: width, height: height)
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let identifier = MenuMainGardenCollectionViewCell.identifier
        let reusableCell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? MenuMainGardenCollectionViewCell
        guard let cell = reusableCell else {
            fatalError("Cannot dequeueReusableCell \(identifier) with reuseIdentifier \(identifier)")
        }
        let menu = self.displayedMenu[indexPath.row]
        let model = MenuMainGardenCollectionViewCell.Model(menu: menu)
        cell.fill(withModel: model)
        return cell
    }

    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        let menu = self.displayedMenu[indexPath.row]
        switch menu {
        case .animalRoom:
            self.showAnimalRoomScene()
            break
        case .inventory:
            self.showInventoryScene()
            break
        case .reward:
            self.showRewardScene()
            break
        case .setting:
            self.showSettingScene()
            break
        case .shop:
            self.showShopScene()
            break
        }
    }

}

// MARK: - Route Function
extension MainGardenViewController {

    private func showAnimalRoomScene() {
        let storyboard = UIStoryboard(name: "AnimalRoomViewController", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "AnimalRoomVC")
        self.present(vc, animated: true)
    }

    private func showInventoryScene() {
    }

    private func showRewardScene() {
    }

    private func showSettingScene() {
        let storyboard = UIStoryboard(name: "SettingsViewController", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "SettingsViewController")
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true)
    }

    private func showShopScene() {
    }

}
