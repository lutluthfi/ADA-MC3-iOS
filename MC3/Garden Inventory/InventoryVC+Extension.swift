//
//  InventoryViewController.swift
//  MC3
//
//  Created by Jeremy Jason on 23/07/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

extension InventoryVC {
    func rewardBtnStatus(reward: String) {
        switch reward {
        case "bush":
            bushBtnStatus = true
            benchBtnStatus = false
            flowerBtnStatus = false
            lampBtnStatus = false
            treeBtnStatus = false
        case "bench":
            bushBtnStatus = false
            benchBtnStatus = true
            flowerBtnStatus = false
            lampBtnStatus = false
            treeBtnStatus = false
        case "flower":
            bushBtnStatus = false
            benchBtnStatus = false
            flowerBtnStatus = true
            lampBtnStatus = false
            treeBtnStatus = false
        case "lamp":
            bushBtnStatus = false
            benchBtnStatus = false
            flowerBtnStatus = false
            lampBtnStatus = true
            treeBtnStatus = false
        case "tree":
            bushBtnStatus = false
            benchBtnStatus = false
            flowerBtnStatus = false
            lampBtnStatus = false
            treeBtnStatus = true
        default:
            break
        }
    }
    
    func btnColorStatus(btn: String) {
        switch btn {
        case "bush":
            bushBtn.backgroundColor = UIColor(named: "413834")
            benchBtn.backgroundColor = UIColor(named: "221D1A")
            flowerBtn.backgroundColor = UIColor(named: "221D1A")
            lampBtn.backgroundColor = UIColor(named: "221D1A")
            treeBtn.backgroundColor = UIColor(named: "221D1A")
        case "bench":
            bushBtn.backgroundColor = UIColor(named: "221D1A")
            benchBtn.backgroundColor = UIColor(named: "413834")
            flowerBtn.backgroundColor = UIColor(named: "221D1A")
            lampBtn.backgroundColor = UIColor(named: "221D1A")
            treeBtn.backgroundColor = UIColor(named: "221D1A")
        case "flower":
            bushBtn.backgroundColor = UIColor(named: "221D1A")
            benchBtn.backgroundColor = UIColor(named: "221D1A")
            flowerBtn.backgroundColor = UIColor(named: "413834")
            lampBtn.backgroundColor = UIColor(named: "221D1A")
            treeBtn.backgroundColor = UIColor(named: "221D1A")
        case "lamp":
            bushBtn.backgroundColor = UIColor(named: "221D1A")
            benchBtn.backgroundColor = UIColor(named: "221D1A")
            flowerBtn.backgroundColor = UIColor(named: "221D1A")
            lampBtn.backgroundColor = UIColor(named: "413834")
            treeBtn.backgroundColor = UIColor(named: "221D1A")
        case "tree":
            bushBtn.backgroundColor = UIColor(named: "221D1A")
            benchBtn.backgroundColor = UIColor(named: "221D1A")
            flowerBtn.backgroundColor = UIColor(named: "221D1A")
            lampBtn.backgroundColor = UIColor(named: "221D1A")
            treeBtn.backgroundColor = UIColor(named: "413834")
        default:
            break
        }
    }
    
    func setImageDisable(reward: UIButton) {
        switch reward.isEnabled {
        case false:
            reward.setImage(UIImage(named: "Reward-Disable-1"), for: .normal)
        default:
            break
        }
    }
    
    func arrowAnimate(_ category: String) {
        switch category {
        case "bush":
            UIView.animate(
                withDuration: 0.5,
                delay: 0,
                usingSpringWithDamping: 1,
                initialSpringVelocity: 5,
                options: [.autoreverse, .repeat],
                animations: {
                    self.bushArrow1.transform = CGAffineTransform(translationX: 0, y: 10)
                    self.bushArrow2.transform = CGAffineTransform(translationX: 0, y: 10)
            },
                completion: nil)
        case "bench":
            UIView.animate(
                withDuration: 0.5,
                delay: 0,
                usingSpringWithDamping: 1,
                initialSpringVelocity: 5,
                options: [.autoreverse, .repeat],
                animations: {
                    self.benchArrow1.transform = CGAffineTransform(translationX: 0, y: 10)
                    self.benchArrow2.transform = CGAffineTransform(translationX: 0, y: 10)
            },
                completion: nil)
        case "lamp":
            UIView.animate(
                withDuration: 0.5,
                delay: 0,
                usingSpringWithDamping: 1,
                initialSpringVelocity: 5,
                options: [.autoreverse, .repeat],
                animations: {
                    self.lampArrow1.transform = CGAffineTransform(translationX: 0, y: 10)
                    self.lampArrow2.transform = CGAffineTransform(translationX: 0, y: 10)
            },
                completion: nil)
        case "tree":
            UIView.animate(
                withDuration: 0.5,
                delay: 0,
                usingSpringWithDamping: 1,
                initialSpringVelocity: 5,
                options: [.autoreverse, .repeat],
                animations: {
                    self.treeArrow1.transform = CGAffineTransform(translationX: 0, y: 10)
                    self.treeArrow2.transform = CGAffineTransform(translationX: 0, y: 10)
            },
                completion: nil)
        default:
            break
        }
        
    }
}
