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
        static let kCloudSizes = [
            CGSize(width: 50, height: 50),
            CGSize(width: 100, height: 100),
            CGSize(width: 150, height: 150)
        ]
        static let kCoinContainerViewBorderWidth = CGFloat(3)
        static let kCoinContainerViewCornerRadius = CGFloat(5)
        static let kDayCloudsImage = [
            UIImage(named: "Cloud-Day-1"),
            UIImage(named: "Cloud-Day-2"),
            UIImage(named: "Cloud-Day-3"),
            UIImage(named: "Cloud-Day-4")
        ]
        static let kHideCenterYPetAnimalInfoImageViewConstraint = CGFloat(150)
        static let kHideLeadingAllStatusAnimalInfoContainerViewConstraint = CGFloat(-150)
        static let kInitialCloudCount = Int(4)
        static let kNightCloudsImage = [
            UIImage(named: "Cloud-Night-1"),
            UIImage(named: "Cloud-Night-2"),
            UIImage(named: "Cloud-Night-3"),
            UIImage(named: "Cloud-Night-4")
        ]
        static let kPetMaxYPosition = CGFloat(200)
        static let kPetMinYPosition = CGFloat(295)
        static let kPlayCloudTimerTimeInterval = TimeInterval(5)
        static let kPlayCloudMaxVelocityTimeInterval = TimeInterval(60)
        static let kPlayCloudMinVelocityTimeInterval = TimeInterval(35)
        static let kShowCenterYPetAnimalInfoImageViewConstraint = CGFloat(0)
        static let kShowLeadingAllStatusAnimalInfoContainerViewConstraint = CGFloat(200)
        static let kStatusAnimalInfoProgressViewCorner = CGFloat(2)
        static let kStatusAnimalInfoProgressViewTransform = CGAffineTransform(
            scaleX: 1,
            y: 4.5
        )
        static let kYCloudPositionRange = .zero ..< CGFloat(80)

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

    @IBOutlet weak var aboveGroundContainerView: UIView!
    @IBOutlet weak var allStatusAnimalInfoContainerView: UIView!
    @IBOutlet weak var allStatusAnimalInfoBackgroundImageView: UIImageView!
    @IBOutlet weak var buildingImageView: UIImageView!
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

    
    @IBOutlet var imgBush1: UIImageView!
    @IBOutlet var imgBush2: UIImageView!
    @IBOutlet var imgLamp1: UIImageView!
    @IBOutlet var imgLamp2: UIImageView!
    @IBOutlet var imgTree1: UIImageView!
    @IBOutlet var imgBench1: UIImageView!
    
    private lazy var dialogFactory = DialogFactory()

    private let displayedMenu: [MenuMainGardenCollectionViewCell.Model.Menu] = [
        .setting,
        .reward,
        .shop,
        .inventory,
        .animalRoom
    ]
    private var isCloudAnimating = false
    private var initialClouds: [(cloudImageView: UIImageView, velocityDuration: TimeInterval)] = []

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
        self.doInitialAnimateCloudImageView()
        self.doAnimateCloudImageView()
        //        let dialogId = UUID().uuidString
        //        let dialogScene = DialogFactory
        //            .Scene
        //            .animalInfo(dialogId: dialogId, delegate: nil)
        //        self.dialogFactory.show(scene: dialogScene)
        
        self.preparePlaceholderItem()
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

    private func doGenerateCloudImageView(xPosition: CGFloat = .zero) -> UIImageView {
        let cgSize = Constant.kCloudSizes.randomElement() ?? .zero
        let yPositionRange = Constant.kYCloudPositionRange
        let yPosition = CGFloat.random(in: yPositionRange)
        let cgPoint = CGPoint(x: (xPosition - cgSize.width), y: yPosition)
        let cloudImageView = UIImageView()
        cloudImageView.frame = CGRect(origin: cgPoint, size: cgSize)
        cloudImageView.contentMode = .scaleAspectFit
        cloudImageView.image = Constant.kDayCloudsImage.randomElement() as? UIImage
        return cloudImageView
    }

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

    private func doAnimateCloudImageView() {
        Timer.scheduledTimer(
            withTimeInterval: Constant.kPlayCloudTimerTimeInterval,
            repeats: true,
            block: { (timer) in
                print(Calendar.current.component(.second, from: timer.fireDate))
                let cloudImageView = self.doGenerateCloudImageView()
                self.aboveGroundContainerView.addSubview(cloudImageView)
                Bool.random() ?
                    self.aboveGroundContainerView.bringSubviewToFront(cloudImageView) :
                    self.aboveGroundContainerView.sendSubviewToBack(cloudImageView)
                let velocityDuration = TimeInterval.random(
                    in: Constant.kPlayCloudMinVelocityTimeInterval
                    ...
                    Constant.kPlayCloudMaxVelocityTimeInterval
                )
                UIView.animate(withDuration: velocityDuration, animations: {
                    cloudImageView.frame.origin.x =
                        UIScreen.main.bounds.maxX + cloudImageView.frame.width
                    self.aboveGroundContainerView.layoutIfNeeded()
                }, completion: { (_) in
                    cloudImageView.removeFromSuperview()
                })
        })
    }

    private func doInitialAnimateCloudImageView() {
        let xPositionRange = CGFloat(100)...(self.aboveGroundContainerView.frame.width - CGFloat(100))
        let xPosition = CGFloat.random(in: xPositionRange)
        let cloudImageView = self.doGenerateCloudImageView(xPosition: xPosition)
        cloudImageView.transform = CGAffineTransform(scaleX: .zero, y: .zero)
        self.aboveGroundContainerView.addSubview(cloudImageView)
        Bool.random() ?
            self.aboveGroundContainerView.bringSubviewToFront(cloudImageView) :
            self.aboveGroundContainerView.sendSubviewToBack(cloudImageView)
        let velocityDuration = TimeInterval.random(
            in: Constant.kPlayCloudMinVelocityTimeInterval
                ...
                Constant.kPlayCloudMaxVelocityTimeInterval
        )
        self.initialClouds.append((cloudImageView, velocityDuration))
        UIView.animate(
            withDuration: 1,
            delay: .zero,
            usingSpringWithDamping: 0.65,
            initialSpringVelocity: 5.0,
            options: .curveEaseOut,
            animations: ({
                cloudImageView.transform = .identity
            }),
            completion: { (_) in
                if self.initialClouds.count == Constant.kInitialCloudCount {
                    self.initialClouds.forEach({ (cloud) in
                        UIView.animate(withDuration: cloud.velocityDuration, animations: {
                            cloud.cloudImageView.frame.origin.x =
                                UIScreen.main.bounds.maxX + cloud.cloudImageView.frame.width
                            self.aboveGroundContainerView.layoutIfNeeded()
                        }, completion: { (_) in
                            cloud.cloudImageView.removeFromSuperview()
                        })
                    })
                    self.initialClouds.removeAll()
                } else {
                    self.doInitialAnimateCloudImageView()
                }
            })
    }
    
    // NEEDED! Do not delete!
    @IBAction func unwindToMainGardenView(_ segue : UIStoryboardSegue) {
      // Do nothing
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
        let storyboard = UIStoryboard(name: "InventoryStoryboard", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "InventoryVC") as InventoryVC
        vc.modalTransitionStyle = .crossDissolve
        vc.delegate = self
        self.present(vc, animated: true)
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

extension MainGardenViewController: InventoryDelegate {
    func preparePlaceholderItem() {
        prepareItemPlaceholder1()
        prepareItemPlaceholder2()
        prepareItemPlaceholder3()
        prepareItemPlaceholder4()
        prepareItemPlaceholder5()
        prepareItemPlaceholder6()
        prepareItemPlaceholder7()
        prepareItemPlaceholder8()
    }
    
    func prepareItemPlaceholder1() {
        let itemPlaceholder1: String? = settingsDefaults.string(forKey: SettingsKey.itemPlaceholder1)
        switch itemPlaceholder1 {
        case InventoryList.bush1:
            imgBush1.isHidden = false
            imgBush1.layer.frame = InventoryPosition.bush1Pos1Frame
            break
        case InventoryList.bush2:
            imgBush2.isHidden = false
            imgBush2.layer.frame = InventoryPosition.bush2Pos1Frame
            break
        default:
            break
        }
    }
    
    func prepareItemPlaceholder2() {
        let itemPlaceholder2: String? = settingsDefaults.string(forKey: SettingsKey.itemPlaceholder2)
        switch itemPlaceholder2 {
        case InventoryList.bush1:
              imgBush1.isHidden = false
              imgBush1.layer.frame = InventoryPosition.bush1Pos2Frame
              break
        case InventoryList.bush2:
              imgBush2.isHidden = false
              imgBush2.layer.frame = InventoryPosition.bush2Pos2Frame
              break
          default:
              break
          }
    }
    
    func prepareItemPlaceholder3() {
        let itemPlaceholder3: String? = settingsDefaults.string(forKey: SettingsKey.itemPlaceholder3)
        switch itemPlaceholder3 {
        case InventoryList.bench1Flip:
              imgBench1.isHidden = false
              imgBench1.layer.frame = InventoryPosition.benchFlip1Pos3Frame
              break
          default:
              break
        }
    }
    
    func prepareItemPlaceholder4() {
        let itemPlaceholder4: String? = settingsDefaults.string(forKey: SettingsKey.itemPlaceholder4)
        switch itemPlaceholder4 {
        case InventoryList.bench1:
              imgBench1.isHidden = false
              imgBench1.layer.frame = InventoryPosition.bench1Pos4Frame
              break
          default:
              break
        }
    }
    
    func prepareItemPlaceholder5() {
        let itemPlaceholder5: String? = settingsDefaults.string(forKey: SettingsKey.itemPlaceholder5)
        switch itemPlaceholder5 {
        case InventoryList.lamp1:
            imgLamp1.isHidden = false
            imgLamp1.layer.frame = InventoryPosition.lamp1Pos5Frame
            break
        case InventoryList.lamp2:
            imgLamp2.isHidden = false
            imgLamp2.layer.frame = InventoryPosition.lamp2Pos5Frame
            break
        default:
            break
        }
    }
    
    func prepareItemPlaceholder6() {
        let itemPlaceholder6: String? = settingsDefaults.string(forKey: SettingsKey.itemPlaceholder6)
        switch itemPlaceholder6 {
        case InventoryList.lamp1:
            imgLamp1.isHidden = false
            imgLamp1.layer.frame = InventoryPosition.lamp1Pos6Frame
            break
        case InventoryList.lamp2:
            imgLamp2.isHidden = false
            imgLamp2.layer.frame = InventoryPosition.lamp2Pos6Frame
            break
        default:
            break
        }
    }
    
    func prepareItemPlaceholder7() {
        let itemPlaceholder7: String? = settingsDefaults.string(forKey: SettingsKey.itemPlaceholder7)
        switch itemPlaceholder7 {
        case InventoryList.tree1:
            imgTree1.isHidden = false
            imgTree1.layer.frame = InventoryPosition.tree1Pos7Frame
            break
        default:
            break
        }
    }
    
    func prepareItemPlaceholder8() {
        let itemPlaceholder8: String? = settingsDefaults.string(forKey: SettingsKey.itemPlaceholder8)
        switch itemPlaceholder8 {
        case InventoryList.tree1:
            imgTree1.isHidden = false
            imgTree1.layer.frame = InventoryPosition.tree1Pos8Frame
            break
        default:
            break
        }
    }
    
    func placeBush(type: Int, position: Int) {
        switch type {
        case 1:
            self.imgBush1.isHidden = false
            if (position == 1) {
                settingsDefaults.set(InventoryList.bush1, forKey: SettingsKey.itemPlaceholder1)
                self.imgBush1.layer.frame = InventoryPosition.bush1Pos1Frame
            } else {
                settingsDefaults.set(InventoryList.bush1, forKey: SettingsKey.itemPlaceholder2)
                self.imgBush1.layer.frame = InventoryPosition.bush1Pos2Frame
            }
            break
        case 2:
            self.imgBush2.isHidden = false
            if (position == 1) {
                settingsDefaults.set(InventoryList.bush2, forKey: SettingsKey.itemPlaceholder1)
                self.imgBush2.layer.frame = InventoryPosition.bush2Pos1Frame
            } else {
                settingsDefaults.set(InventoryList.bush2, forKey: SettingsKey.itemPlaceholder2)
                self.imgBush2.layer.frame = InventoryPosition.bush2Pos2Frame
            }
            break
        default:
            break
        }
    }
    
    func placeBench(type: Int, position: Int) {
        switch type {
        case 1:
            self.imgBench1.isHidden = false
            if (position == 3) {
                settingsDefaults.set(InventoryList.bench1Flip, forKey: SettingsKey.itemPlaceholder3)
                self.imgBench1.image = #imageLiteral(resourceName: "Bench-Flip")
                self.imgBench1.layer.frame = InventoryPosition.benchFlip1Pos3Frame
            } else {
                settingsDefaults.set(InventoryList.bench1, forKey: SettingsKey.itemPlaceholder4)
                self.imgBench1.image = #imageLiteral(resourceName: "Bench")
                self.imgBench1.layer.frame = InventoryPosition.bench1Pos4Frame
            }
            break
        default:
            break
        }
    }
    
    func placeLamp(type: Int, position: Int) {
        switch type {
        case 1:
            self.imgLamp1.isHidden = false
            if (position == 5) {
                settingsDefaults.set(InventoryList.lamp1, forKey: SettingsKey.itemPlaceholder5)
                self.imgLamp1.layer.frame = InventoryPosition.lamp1Pos5Frame
            } else {
                settingsDefaults.set(InventoryList.lamp1, forKey: SettingsKey.itemPlaceholder6)
                self.imgLamp1.layer.frame = InventoryPosition.lamp1Pos6Frame
            }
            break
        case 2:
            self.imgLamp2.isHidden = false
            if (position == 5) {
                settingsDefaults.set(InventoryList.lamp2, forKey: SettingsKey.itemPlaceholder5)
                self.imgLamp2.layer.frame = InventoryPosition.lamp2Pos5Frame
            } else {
                settingsDefaults.set(InventoryList.lamp2, forKey: SettingsKey.itemPlaceholder6)
                self.imgLamp2.layer.frame = InventoryPosition.lamp2Pos6Frame
            }
            break
        default:
            break
        }
    }
    
    func placeTree(type: Int, position: Int) {
        switch type {
        case 1:
            self.imgTree1.isHidden = false
            if (position == 7) {
                settingsDefaults.set(InventoryList.tree1, forKey: SettingsKey.itemPlaceholder7)
                self.imgTree1.layer.frame = InventoryPosition.tree1Pos7Frame
            } else {
                settingsDefaults.set(InventoryList.tree1, forKey: SettingsKey.itemPlaceholder8)
                self.imgTree1.layer.frame = InventoryPosition.tree1Pos8Frame
            }
            break
        default:
            break
        }
    }
}
