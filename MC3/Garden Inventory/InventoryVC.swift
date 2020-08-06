//
//  InventoryViewController.swift
//  MC3
//
//  Created by Jeremy Jason on 23/07/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

protocol InventoryDelegate {
    func placeBush(type: Int, position: Int)
    func placeBench(type: Int, position: Int)
    func placeLamp(type: Int, position: Int)
    func placeTree(type: Int, position: Int)
}

class InventoryVC: UIViewController {
    
    var bushBtnStatus: Bool = true
    var benchBtnStatus: Bool = false
    var flowerBtnStatus: Bool = false
    var lampBtnStatus: Bool = false
    var treeBtnStatus: Bool = false
    
    var bushPlaceholder1Occupied: Bool = false
    var bushPlaceholder2Occupied: Bool = false
    var benchPlaceholder1Occupied: Bool = false
    var benchPlaceholder2Occupied: Bool = false
    var lampPlaceholder1Occupied: Bool = false
    var lampPlaceholder2Occupied: Bool = false
    var treePlaceholder1Occupied: Bool = false
    var treePlaceholder2Occupied: Bool = false
    
    @IBOutlet weak var dim: UIView!
    
    @IBOutlet weak var rewardsContainer: UIView!
    @IBOutlet weak var bushBtn: UIButton!
    @IBOutlet weak var benchBtn: UIButton!
    @IBOutlet weak var flowerBtn: UIButton!
    @IBOutlet weak var lampBtn: UIButton!
    @IBOutlet weak var treeBtn: UIButton!
    
    @IBOutlet weak var reward1: UIButton!
    @IBOutlet weak var reward2: UIButton!
    @IBOutlet weak var reward3: UIButton!
    @IBOutlet weak var reward4: UIButton!
    @IBOutlet weak var reward5: UIButton!
    
    @IBOutlet weak var bushArrow1: UIImageView!
    @IBOutlet weak var bushArrow2: UIImageView!
    @IBOutlet weak var benchArrow1: UIImageView!
    @IBOutlet weak var benchArrow2: UIImageView!
    @IBOutlet weak var lampArrow1: UIImageView!
    @IBOutlet weak var lampArrow2: UIImageView!
    @IBOutlet weak var treeArrow1: UIImageView!
    @IBOutlet weak var treeArrow2: UIImageView!
    
    @IBOutlet weak var bushPlaceholder1: UIButton!
    @IBOutlet weak var bushPlaceholder2: UIButton!
    @IBOutlet weak var benchPlaceholder1: UIButton!
    @IBOutlet weak var benchPlaceholder2: UIButton!
    @IBOutlet weak var lampPlaceholder1: UIButton!
    @IBOutlet weak var lampPlaceholder2: UIButton!
    @IBOutlet weak var treePlaceholder1: UIButton!
    @IBOutlet weak var treePlaceholder2: UIButton!
    
    let defaults = UserDefaults.standard
    
    var delegate: InventoryDelegate?
    
    var selectedItemIndex: Int = 0
    
    var placeholderItem1: String?
    var placeholderItem2: String?
    var placeholderItem3: String?
    var placeholderItem4: String?
    var placeholderItem5: String?
    var placeholderItem6: String?
    var placeholderItem7: String?
    var placeholderItem8: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.isOpaque = true
        reward1.isEnabled = true
        reward2.isEnabled = true
        reward3.isEnabled = false
        reward4.isEnabled = false
        reward5.isEnabled = false
        
        reward1.adjustsImageWhenDisabled = true
        reward2.adjustsImageWhenDisabled = true
        reward3.adjustsImageWhenDisabled = true
        reward4.adjustsImageWhenDisabled = true
        reward5.adjustsImageWhenDisabled = true
        
        placeholderItem1 = settingsDefaults.string(forKey: SettingsKey.itemPlaceholder1)
        placeholderItem2 = settingsDefaults.string(forKey: SettingsKey.itemPlaceholder2)
        placeholderItem3 = settingsDefaults.string(forKey: SettingsKey.itemPlaceholder3)
        placeholderItem4 = settingsDefaults.string(forKey: SettingsKey.itemPlaceholder4)
        placeholderItem5 = settingsDefaults.string(forKey: SettingsKey.itemPlaceholder5)
        placeholderItem6 = settingsDefaults.string(forKey: SettingsKey.itemPlaceholder6)
        placeholderItem7 = settingsDefaults.string(forKey: SettingsKey.itemPlaceholder7)
        placeholderItem8 = settingsDefaults.string(forKey: SettingsKey.itemPlaceholder8)
        
        bushPlaceholder1Occupied = placeholderItem1 != nil
        bushPlaceholder2Occupied = placeholderItem2 != nil
        benchPlaceholder1Occupied = placeholderItem3 != nil
        benchPlaceholder2Occupied = placeholderItem4 != nil
        lampPlaceholder1Occupied = placeholderItem5 != nil
        lampPlaceholder2Occupied = placeholderItem6 != nil
        treePlaceholder1Occupied = placeholderItem7 != nil
        treePlaceholder2Occupied = placeholderItem8 != nil
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showBottomAction()
        self.modalTransitionStyle = .coverVertical
        self.bushBtnTap(bushBtn)
    }
    
    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            usingSpringWithDamping: 0.8,
            initialSpringVelocity: 3,
            options: .curveEaseIn,
            animations: {
                self.rewardsContainer.transform = .identity
                self.dim.alpha = 0

                self.bushPlaceholder1.alpha = 0
                self.bushPlaceholder2.alpha = 0
                self.benchPlaceholder1.alpha = 0
                self.benchPlaceholder2.alpha = 0
                self.lampPlaceholder1.alpha = 0
                self.lampPlaceholder2.alpha = 0
                self.treePlaceholder1.alpha = 0
                self.treePlaceholder2.alpha = 0

                self.bushArrow1.alpha = 0
                self.bushArrow2.alpha = 0
                self.benchArrow1.alpha = 0
                self.benchArrow2.alpha = 0
                self.lampArrow1.alpha = 0
                self.lampArrow2.alpha = 0
                self.treeArrow1.alpha = 0
                self.treeArrow2.alpha = 0
        },
        completion: { (isComplete) in
            self.dismiss(animated: false, completion: nil)
        })
    }
    
    func showBottomAction() {
        UIView.animate(
            withDuration: 1,
            delay: 0,
            usingSpringWithDamping: 0.8,
            initialSpringVelocity: 5,
            options: .curveEaseInOut,
            animations: {
                self.dim.alpha = 1
                self.rewardsContainer.transform = CGAffineTransform(translationX: 0, y: -120)
        },
            completion: nil)
    }
    
    @IBAction func bushBtnTap(_ sender: UIButton) {
        rewardBtnStatus(reward: "bush")
        btnColorStatus(btn: "bush")
        
        if (placeholderItem1 == InventoryList.bush1 || placeholderItem2 == InventoryList.bush1) {
            reward1.isEnabled = false
            reward1.setImage(#imageLiteral(resourceName: "Reward-Disable-1"), for: .disabled)
        } else {
            reward1.isEnabled = true
            reward1.setImage(UIImage(named: "Reward-Bush-1"), for: .normal)
        }
        
        if (placeholderItem1 == InventoryList.bush2 || placeholderItem2 == InventoryList.bush2) {
            reward2.isEnabled = false
            reward2.setImage(#imageLiteral(resourceName: "Reward-Disable-2"), for: .disabled)
        } else {
            reward2.isEnabled = true
            reward2.setImage(UIImage(named: "Reward-Bush-2"), for: .normal)
        }
        
        setImageDisable(reward: reward3)
        setImageDisable(reward: reward4)
        setImageDisable(reward: reward5)
        
        self.arrowAnimate("bush")
    }
    
    @IBAction func benchBtnTap(_ sender: UIButton) {
        rewardBtnStatus(reward: "bench")
        btnColorStatus(btn: "bench")
        
        if (placeholderItem3 == InventoryList.bench1Flip || placeholderItem4 == InventoryList.bench1) {
            reward1.isEnabled = false
            reward1.setImage(#imageLiteral(resourceName: "Bench-Disable"), for: .disabled)
        } else {
            reward1.isEnabled = true
            reward1.setImage(UIImage(named: "Reward-Bench"), for: .normal)
        }
        
        setImageDisable(reward: reward2)
        setImageDisable(reward: reward3)
        setImageDisable(reward: reward4)
        setImageDisable(reward: reward5)
        
        self.arrowAnimate("bench")
    }
    
    @IBAction func flowerBtnTap(_ sender: UIButton) {
        rewardBtnStatus(reward: "flower")
        btnColorStatus(btn: "flower")
        
        setImageDisable(reward: reward1)
        setImageDisable(reward: reward2)
        setImageDisable(reward: reward3)
        setImageDisable(reward: reward4)
        setImageDisable(reward: reward5)
    }
    
    @IBAction func lampBtnTap(_ sender: UIButton) {
        rewardBtnStatus(reward: "lamp")
        btnColorStatus(btn: "lamp")
        
        if (placeholderItem5 == InventoryList.lamp1 || placeholderItem6 == InventoryList.lamp1) {
            reward1.isEnabled = false
            reward1.setImage(#imageLiteral(resourceName: "Lamp-2-Disable"), for: .disabled)
        } else {
            reward1.isEnabled = true
            reward1.setImage(UIImage(named: "Reward-Lamp-1"), for: .normal)
        }
        
        if (placeholderItem5 == InventoryList.lamp2 || placeholderItem6 == InventoryList.lamp2) {
            reward2.isEnabled = false
            reward2.setImage(#imageLiteral(resourceName: "Lamp-1-Disable"), for: .disabled)
        } else {
            reward2.isEnabled = true
            reward2.setImage(UIImage(named: "Reward-Lamp-2"), for: .normal)
        }
        
        setImageDisable(reward: reward3)
        setImageDisable(reward: reward4)
        setImageDisable(reward: reward5)
        
        arrowAnimate("lamp")
    }
    
    @IBAction func treeBtnTap(_ sender: UIButton) {
        rewardBtnStatus(reward: "tree")
        btnColorStatus(btn: "tree")
        
        if (placeholderItem7 == InventoryList.lamp1 || placeholderItem8 == InventoryList.lamp1) {
            reward1.isEnabled = false
            reward1.setImage(#imageLiteral(resourceName: "Tree-Disable"), for: .disabled)
        } else {
            reward1.isEnabled = true
            reward1.setImage(UIImage(named: "Reward-Tree"), for: .normal)
        }
        
        setImageDisable(reward: reward2)
        setImageDisable(reward: reward3)
        setImageDisable(reward: reward4)
        setImageDisable(reward: reward5)
        
        arrowAnimate("tree")
    }
    
    @IBAction func placeholderLocation(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            delegate?.placeBush(type: selectedItemIndex, position: sender.tag)
        case 2:
            delegate?.placeBush(type: selectedItemIndex, position: sender.tag)
        case 3:
            delegate?.placeBench(type: selectedItemIndex, position: sender.tag)
        case 4:
            delegate?.placeBench(type: selectedItemIndex, position: sender.tag)
        case 5:
            delegate?.placeLamp(type: selectedItemIndex, position: sender.tag)
        case 6:
            delegate?.placeLamp(type: selectedItemIndex, position: sender.tag)
        case 7:
            delegate?.placeTree(type: selectedItemIndex, position: sender.tag)
        case 8:
            delegate?.placeTree(type: selectedItemIndex, position: sender.tag)
        default:
            break
        }
        
        dismiss(animated: false, completion: nil)
    }
    
    @IBAction func rewardIconTap(_ sender: UIButton) {
        selectedItemIndex = sender.tag
        
        if bushBtnStatus == true {
            UIView.animate(
                withDuration: 1,
                delay: 0,
                usingSpringWithDamping: 0.8,
                initialSpringVelocity: 5,
                options: .curveEaseInOut,
                animations: {
                    if self.bushPlaceholder1Occupied == true && self.bushPlaceholder2Occupied == false {
                        self.rewardsContainer.transform = .identity
                        self.bushPlaceholder2.alpha = 1
                        self.bushArrow2.alpha = 1
                    } else if self.bushPlaceholder2Occupied == true && self.bushPlaceholder1Occupied == false {
                        self.rewardsContainer.transform = .identity
                        self.bushPlaceholder1.alpha = 1
                        self.bushArrow1.alpha = 1
                    } else if self.bushPlaceholder1Occupied == false && self.bushPlaceholder2Occupied == false {
                        self.rewardsContainer.transform = .identity
                        self.bushPlaceholder1.alpha = 1
                        self.bushPlaceholder2.alpha = 1
                        self.bushArrow1.alpha = 1
                        self.bushArrow2.alpha = 1
                    }
            },
                completion: nil)
        } else if benchBtnStatus == true {
            UIView.animate(
                withDuration: 1,
                delay: 0,
                usingSpringWithDamping: 0.8,
                initialSpringVelocity: 5,
                options: .curveEaseInOut,
                animations: {
                    if self.benchPlaceholder1Occupied == true && self.benchPlaceholder2Occupied == false {
                        self.rewardsContainer.transform = .identity
                        self.benchPlaceholder2.alpha = 1
                        self.benchArrow2.alpha = 1
                    } else if self.benchPlaceholder2Occupied == true && self.benchPlaceholder1Occupied == false {
                        self.rewardsContainer.transform = .identity
                        self.benchPlaceholder1.alpha = 1
                        self.benchArrow1.alpha = 1
                    } else if self.benchPlaceholder1Occupied == false && self.benchPlaceholder2Occupied == false {
                        self.rewardsContainer.transform = .identity
                        self.benchPlaceholder1.alpha = 1
                        self.benchPlaceholder2.alpha = 1
                        self.benchArrow1.alpha = 1
                        self.benchArrow2.alpha = 1
                    }
            },
                completion: nil)
        } else if lampBtnStatus == true {
            UIView.animate(
                withDuration: 1,
                delay: 0,
                usingSpringWithDamping: 0.8,
                initialSpringVelocity: 5,
                options: .curveEaseInOut,
                animations: {
                    if self.lampPlaceholder1Occupied == true && self.lampPlaceholder2Occupied == false {
                        self.rewardsContainer.transform = .identity
                        self.lampPlaceholder2.alpha = 1
                        self.lampArrow2.alpha = 1
                    } else if self.lampPlaceholder2Occupied == true && self.lampPlaceholder1Occupied == false {
                        self.rewardsContainer.transform = .identity
                        self.lampPlaceholder1.alpha = 1
                        self.lampArrow1.alpha = 1
                    } else if self.lampPlaceholder1Occupied == false && self.lampPlaceholder2Occupied == false {
                        self.rewardsContainer.transform = .identity
                        self.lampPlaceholder1.alpha = 1
                        self.lampPlaceholder2.alpha = 1
                        self.lampArrow1.alpha = 1
                        self.lampArrow2.alpha = 1
                    }
            },
                completion: nil)
        } else if treeBtnStatus == true {
            UIView.animate(
                withDuration: 1,
                delay: 0,
                usingSpringWithDamping: 0.8,
                initialSpringVelocity: 5,
                options: .curveEaseInOut,
                animations: {
                    if self.treePlaceholder1Occupied == true && self.treePlaceholder2Occupied == false {
                        self.rewardsContainer.transform = .identity
                        self.treePlaceholder2.alpha = 1
                        self.treeArrow2.alpha = 1
                    } else if self.treePlaceholder2Occupied == true && self.treePlaceholder1Occupied == false {
                        self.rewardsContainer.transform = .identity
                        self.treePlaceholder1.alpha = 1
                        self.treeArrow1.alpha = 1
                    } else if self.treePlaceholder1Occupied == false && self.treePlaceholder2Occupied == false {
                        self.rewardsContainer.transform = .identity
                        self.treePlaceholder1.alpha = 1
                        self.treePlaceholder2.alpha = 1
                        self.treeArrow1.alpha = 1
                        self.treeArrow2.alpha = 1
                    }
            },
                completion: nil)
        }
    }
    
}
