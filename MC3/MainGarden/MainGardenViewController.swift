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

        static let kCoinContainerViewBorderWidth = CGFloat(3)
        static let kCoinContainerViewCornerRadius = CGFloat(5)

    }

}

class MainGardenViewController: UIViewController {

    static let identifier = String(describing: MainGardenViewController.self)

    @IBOutlet weak var coinAmountLabel: UILabel!
    @IBOutlet weak var coinContainerView: UIView!
    @IBOutlet weak var menuCollectionView: UICollectionView!
    @IBOutlet weak var scrollView: UIScrollView!

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
        let dialogId = UUID().uuidString
        let dialogScene = DialogFactory
            .Scene
            .animalInfo(dialogId: dialogId, delegate: nil)
        self.dialogFactory.show(scene: dialogScene)
    }

}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
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
    }

    private func showInventoryScene() {
    }

    private func showRewardScene() {
    }

    private func showSettingScene() {
        let storyboard = UIStoryboard(name: "TestSettingsViewController", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "SettingsViewController")
        self.present(vc, animated: true)
    }

    private func showShopScene() {
    }

}
