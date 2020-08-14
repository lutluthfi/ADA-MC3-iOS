//
//  AnimalRoomVC.swift
//  MC3
//
//  Created by Muhammad Faruuq Qayyum on 16/07/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit
import AVFoundation

class AnimalRoomVC: UIViewController {
    
    let bowlIcons: [UIImage] = [#imageLiteral(resourceName: "Bowl-Empty"), #imageLiteral(resourceName: "Bowl-Half"), #imageLiteral(resourceName: "Bowl-Full"), #imageLiteral(resourceName: "Bowl-Excess")]
    var bowlPresent: Bool = false
    var timer: Timer?
    var currentTimer: Int = 0
    let emitterLayer = CAEmitterLayer()
    var catPurr: AVAudioPlayer?
    var sleepingState: Bool = false
    var animator: UIDynamicAnimator?
    var catName: String = ""
    
    var onBoardingStage: String = "food"
    var onBoardingFoodBefore: Bool = false
    var onBoardingSleepBefore: Bool = false
    var onBoardingHealthBefore: Bool = false
    var onBoardingLoveBefore: Bool = false
    
    //MARK: - Background Item
    let background: UIImageView = {
        let img = UIImageView()
        img.image = #imageLiteral(resourceName: "Background-Animal-Room")
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    //MARK: - Basket Item
    let basket: UIImageView = {
        let img = UIImageView()
        img.image = #imageLiteral(resourceName: "Basket")
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    //MARK: - Progress View Item
    let progressBarBackgroundContainer: UIView = {
        let background = UIView()
        background.backgroundColor = UIColor(named: "BG")
        background.layer.cornerRadius = 10
        background.translatesAutoresizingMaskIntoConstraints = false
        return background
    }()
    
    var progressBarIcon: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "Food-Icon-ProgressBar")
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let progressBarBackground: UIView = {
        let background = UIView()
        background.backgroundColor = UIColor(named: "413834")
        background.layer.cornerRadius = 5
        background.translatesAutoresizingMaskIntoConstraints = false
        return background
    }()
    
    let progressBar: UIProgressView = {
        let progressBar = UIProgressView()
        progressBar.progressTintColor = UIColor(named: "BG")
        progressBar.trackTintColor = UIColor(named: "413834")
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        return progressBar
    }()
    
    //MARK: - Cat Items
    
    //MARK: Cat Normal
    let catNormal: UIImageView = {
        let img = UIImageView()
        img.image = #imageLiteral(resourceName: "Cat-Normal-1")
        img.isUserInteractionEnabled = true
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    //MARK: Cat Sleeping
    let catSleeping: UIImageView = {
        let img = UIImageView()
        img.image = #imageLiteral(resourceName: "Cat-Sleeping")
        img.isHidden = true
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    //MARK: Lamp
    let lamp: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "Lamp-Sleep"), for: .normal)
        btn.alpha = 0
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(lampAction), for: .touchUpInside)
        return btn
    }()
    
    @objc func lampAction(sender: UIButton) {
        if sleepingState == false {
            sleepingState = true
            catNormal.isHidden = true
            catSleeping.image = #imageLiteral(resourceName: "Cat-Sleeping")
            catSleeping.isHidden = false
            spawnCoin()
            
            self.z1Animation()
            
            let attributedTextFull = NSMutableAttributedString(
                string: "\(catName) is sleeping!",
                attributes: [NSAttributedString.Key.font : UIFont(name: "HappyMonkey-Regular", size: 20)!])
            attributedTextFull.append(NSAttributedString(
                string: "\n\nYou earned $10 for giving \(catName) time to sleep. Come back later to play with \(catName) again. \nDid You Know? Adult cat mostly sleeps 12 to 19 hours per day!",
                attributes: [NSAttributedString.Key.font : UIFont(name: "ChalkboardSE-Bold", size: 15)!]))
            overlayText.attributedText = attributedTextFull
            overlayText.textAlignment = .center
            self.overlayAnimation()
            overlaySleepingMode.alpha = 1
            
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerSleeping), userInfo: nil, repeats: true)
            
        } else {
            sleepingState = false
            catSleeping.isHidden = false
            catSleeping.image = UIImage(named: "Cat-Awake")
            catNormal.isHidden = true
            overlaySleepingMode.alpha = 0
            zPopUp1.isHidden = true
            zPopUp2.isHidden = true
            zPopUp3.isHidden = true
            timer?.invalidate()
            currentTimer = 0
            progressBarIcon.image = UIImage(systemName: "zzz")
            progressBarIcon.tintColor = UIColor(named: "413834")
            progressBar.setProgress(sleep, animated: true)
            progressBarAnimate()
        }

    }
    
    @objc func timerSleeping() {
        currentTimer += 1
        switch currentTimer {
        case 3:
            sleep += 0.2
            settingsDefaults.set(sleep, forKey: Keys.sleep)
            if hunger > 0 {
                hunger -= 0.1
                settingsDefaults.set(hunger, forKey: Keys.hunger)
            }
            if fun > 0 {
                fun -= 0.1
                settingsDefaults.set(fun, forKey: Keys.fun)
            }
        case 5:
            sleep += 0.3
            settingsDefaults.set(sleep, forKey: Keys.sleep)
            if hunger > 0 {
                hunger -= 0.1
                settingsDefaults.set(hunger, forKey: Keys.hunger)
            }
            if fun > 0 {
                fun -= 0.1
                settingsDefaults.set(fun, forKey: Keys.fun)
            }
        case 8:
            sleep += 0.5
            settingsDefaults.set(sleep, forKey: Keys.sleep)
            if hunger > 0 {
                hunger -= 0.1
                settingsDefaults.set(hunger, forKey: Keys.hunger)
            }
            if fun > 0 {
                fun -= 0.1
                settingsDefaults.set(fun, forKey: Keys.fun)
            }
        default:
            break
        }
    }
    
    //MARK: Cat Pop Up
    let sickPopUp: UIImageView = {
        let img = UIImageView()
        img.image = #imageLiteral(resourceName: "Baloon-Energy")
        img.isHidden = true
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let zPopUp1: UIImageView = {
        let img = UIImageView()
        img.image = #imageLiteral(resourceName: "Z")
        img.alpha = 0
        img.isHidden = true
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let zPopUp2: UIImageView = {
        let img = UIImageView()
        img.image = #imageLiteral(resourceName: "Z")
        img.alpha = 0
        img.isHidden = true
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let zPopUp3: UIImageView = {
        let img = UIImageView()
        img.image = #imageLiteral(resourceName: "Z")
        img.alpha = 0
        img.isHidden = true
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    //MARK: Phone Button
    let phone: UIButton = {
        let btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "Phone"), for: .normal)
        btn.alpha = 0
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(phoneAction), for: .touchUpInside)
        return btn
    }()
    
    @objc func phoneAction(sender: UIButton) {
        if hunger > 0 {
            let attributedTextFull = NSMutableAttributedString(
                string: "\(catName) is currently healthy!",
                attributes: [NSAttributedString.Key.font : UIFont(name: "HappyMonkey-Regular", size: 20)!])
            attributedTextFull.append(NSAttributedString(
                string: "\n\nKeep \(catName) healthy by feeding it properly, otherwise \(catName) will be sick.",
                attributes: [NSAttributedString.Key.font : UIFont(name: "ChalkboardSE-Bold", size: 15)!]))
            overlayText.attributedText = attributedTextFull
            overlayText.textAlignment = .center
            self.overlayAnimation()
        } else {
            health += 1
            settingsDefaults.set(health, forKey: Keys.health)
            progressBar.setProgress(health, animated: true)
            
            let alert = UIAlertController(title: "Enter Vet Phone Number", message: "Enter your vet number to be called", preferredStyle: .alert)
            alert.addTextField { (textField) in
                textField.placeholder = "Vet number"
                textField.keyboardType = .numberPad
            }
            
            let actionOk = UIAlertAction(title: "Ok", style: .default) { (action) in
                let vetNumber = alert.textFields?.first?.text
                if let phoneURL = NSURL(string: ("tel://" + vetNumber!)) {
                    UIApplication.shared.open(phoneURL as URL, options: [:], completionHandler: nil)
                }
            }
            
            alert.addAction(actionOk)
            present(alert, animated: true)
            
            let attributedTextFull = NSMutableAttributedString(
                string: "\(catName) is sick!",
                attributes: [NSAttributedString.Key.font : UIFont(name: "HappyMonkey-Regular", size: 20)!])
            attributedTextFull.append(NSAttributedString(
                string: "\n\nYou just called the vet to make an appointment for \(catName).",
                attributes: [NSAttributedString.Key.font : UIFont(name: "ChalkboardSE-Bold", size: 15)!]))
            overlayText.attributedText = attributedTextFull
            overlayText.textAlignment = .center
            self.overlayAnimation()
        }
    }
    
    //MARK: Cat Hand
    let catHand: UIImageView = {
        let img = UIImageView()
        img.image = #imageLiteral(resourceName: "Cat-Hand")
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    //MARK: Cat Food
    let catFood: UIImageView = {
        let img = UIImageView()
        img.image = #imageLiteral(resourceName: "Cat-Food-Box")
        img.alpha = 0
        img.translatesAutoresizingMaskIntoConstraints = false
        img.isUserInteractionEnabled = true
        return img
    }()
    
    @objc func catFoodTap(sender: UILongPressGestureRecognizer) {
        switch sender.state {
            
        case .began:
            catFoodAnimateStart()
            emitter()
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerEnds), userInfo: nil, repeats: true)
        case .ended:
            catFoodAnimateStop()
            timer?.invalidate()
            emitterLayer.removeFromSuperlayer()
        default:
            break
        }
    }
    
    @objc func timerEnds() {
        currentTimer += 1
        switch currentTimer {
        case 1:
            DispatchQueue.main.async {
                self.bowl.image = self.bowlIcons[1]
            }
        case 2:
            DispatchQueue.main.async {
                self.bowl.image = self.bowlIcons[2]
            }
        case 4:
            DispatchQueue.main.async {
                self.bowl.image = self.bowlIcons[3]
            }
        default:
            break
        }
    }
    
    //MARK: Bowl
    var bowl: UIImageView = {
        let img = UIImageView()
        img.image = #imageLiteral(resourceName: "Bowl-Empty")
        img.isUserInteractionEnabled = true
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    @objc func bowlPan(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.view)
        switch sender.state {
        case .began, .changed:
            bowl.center = CGPoint(x: bowl.center.x + translation.x, y: bowl.center.y + translation.y)
            sender.setTranslation(CGPoint.zero, in: self.view)
            
            if bowl.frame.intersects(catNormal.frame) {
                if hunger < 1 {
                    switch bowl.image {
                    case bowlIcons[1]:
                        hunger += 0.1
                        settingsDefaults.set(hunger, forKey: Keys.hunger)
                        sleep -= 0.1
                        settingsDefaults.set(sleep, forKey: Keys.sleep)
//                        progressBarAnimate()
//                        progressBar.setProgress(hunger, animated: true)
                    case bowlIcons[2]:
                        hunger += 0.2
                        settingsDefaults.set(hunger, forKey: Keys.hunger)
                        sleep -= 0.1
                        settingsDefaults.set(sleep, forKey: Keys.sleep)
//                        progressBarAnimate()
//                        progressBar.setProgress(hunger, animated: true)
                    case bowlIcons[3]:
                        hunger += 0.3
                        settingsDefaults.set(hunger, forKey: Keys.hunger)
                        sleep -= 0.1
                        settingsDefaults.set(sleep, forKey: Keys.sleep)
//                        progressBarAnimate()
//                        progressBar.setProgress(hunger, animated: true)
                    default:
                        break
                    }
                    
                    bowl.image = bowlIcons[0]
                    if hunger >= 1 {
                        let attributedTextFull = NSMutableAttributedString(string: "\(catName) is full!", attributes: [NSAttributedString.Key.font : UIFont(name: "HappyMonkey-Regular", size: 20)!])
                        attributedTextFull.append(NSAttributedString(string: "\n\nYou earned $10 for giving \(catName) the right amount of food. Play game with \(catName) to burn its calories.", attributes: [NSAttributedString.Key.font : UIFont(name: "ChalkboardSE-Bold", size: 15)!]))
                        overlayText.attributedText = attributedTextFull
                        overlayText.textAlignment = .center
                        overlayAnimation()
                        spawnCoin()
                    }
                    
                    UIView.animate(
                        withDuration: 0.5,
                        delay: 0,
                        options: .curveEaseOut,
                        animations: {
                            self.bowl.layer.position = CGPoint(x: 165.5, y: 460)
                    },
                        completion: nil)
                } else {
                    let attributedTextFull = NSMutableAttributedString(string: "\(catName) is full!", attributes: [NSAttributedString.Key.font : UIFont(name: "HappyMonkey-Regular", size: 20)!])
                    attributedTextFull.append(NSAttributedString(string: "\n\nYou earned $10 for giving \(catName) the right amount of food. Play game with \(catName) to burn its calories.", attributes: [NSAttributedString.Key.font : UIFont(name: "ChalkboardSE-Bold", size: 15)!]))
                    overlayText.attributedText = attributedTextFull
                    overlayText.textAlignment = .center
                    overlayAnimation()
                }
                
            }
        case .ended:
            currentTimer = 0
            if bowl.layer.position != CGPoint(x: 165.5, y: 460) {
                UIView.animate(
                    withDuration: 0.5,
                    delay: 0,
                    options: .curveEaseOut,
                    animations: {
                        self.bowl.layer.position = CGPoint(x: 165.5, y: 460)
//                },
//                    completion: nil)
                }) { (finished) in
                    self.progressBarAnimate()
                    self.progressBar.setProgress(hunger, animated: true)
                }
            }
            
        default:
            break
        }
    }
    
    let handCare: UIImageView = {
        let img = UIImageView()
        img.image = #imageLiteral(resourceName: "Hand")
        img.isHidden = true
        img.isUserInteractionEnabled = true
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    @objc func handCareDrag(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.view)
        switch sender.state {
        case .began, .changed:
            handCare.center = CGPoint(x: handCare.center.x + translation.x, y: handCare.center.y + translation.y)
            sender.setTranslation(CGPoint.zero, in: self.view)
            
            if handCare.frame.intersects(catNormal.frame) {
                
                if love < 1 {
//                    catPurr?.play()
                    soundManager.play(soundType: .catPurr)
                    love += 0.001
                    settingsDefaults.set(love, forKey: Keys.love)
                    if love >= 1 {
                        spawnCoin()
                    }
                } else {
                    let attributedTextFull = NSMutableAttributedString(string: "\(catName) is happy!", attributes: [NSAttributedString.Key.font : UIFont(name: "HappyMonkey-Regular", size: 20)!])
                    attributedTextFull.append(NSAttributedString(string: "\n\nYou earned $10 for giving \(catName) the right amount of love.", attributes: [NSAttributedString.Key.font : UIFont(name: "ChalkboardSE-Bold", size: 15)!]))
                    overlayText.attributedText = attributedTextFull
                    overlayText.textAlignment = .center
                    overlayAnimation()
                }
            }
        case .ended:
            progressBarAnimate()
            progressBar.setProgress(love, animated: true)
        default:
            break
        }
    }
    
    //MARK: - Rewards Container
    let rewardsContainer: UIImageView = {
        let box = UIImageView()
        box.image = #imageLiteral(resourceName: "Rewards-Icon")
        box.sizeThatFits(CGSize(width: 107, height: 39))
        box.translatesAutoresizingMaskIntoConstraints = false
        return box
    }()
    
    let rewardsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .right
        label.font = UIFont(name: "HappyMonkey-Regular", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - Overlay
    let overlaySleepingMode: UIView = {
        let box = UIView()
        box.backgroundColor = UIColor(named: "Overlay70")
        box.alpha = 0
        box.translatesAutoresizingMaskIntoConstraints = false
        return box
    }()
    
    let overlay: UIView = {
        let box = UIView()
        box.backgroundColor = UIColor(named: "Overlay70")
        box.alpha = 0
        box.translatesAutoresizingMaskIntoConstraints = false
        return box
    }()
    
    let overlayView: UIView = {
        let box = UIView()
        box.backgroundColor = UIColor(named: "PopUp")
        box.layer.cornerRadius = 10
        box.alpha = 0
        box.translatesAutoresizingMaskIntoConstraints = false
        return box
    }()
    
    var overlayText: UITextView = {
        let txt = UITextView()
        let attributedText = NSMutableAttributedString(string: "Your cat is sick!", attributes: [NSAttributedString.Key.font : UIFont(name: "HappyMonkey-Regular", size: 20)!])
        attributedText.append(NSAttributedString(string: "\n\nYou just called the vet to make an appointment for your cat.", attributes: [NSAttributedString.Key.font : UIFont(name: "ChalkboardSE-Bold", size: 15)!]))
        txt.attributedText = attributedText
        txt.textAlignment = .center
        txt.isEditable = false
        txt.isScrollEnabled = false
        txt.backgroundColor = .none
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    let overlayBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor(named: "413834")
        btn.setTitle("Okay", for: .normal)
        btn.titleLabel?.font = UIFont(name: "HappyMonkey-Regular", size: 20)
        btn.tintColor = .white
        btn.layer.cornerRadius = 5
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(overlayDismiss), for: .touchUpInside)
        return btn
    }()
    
    @objc func overlayDismiss(sender: UIButton) {
        overlay.alpha = 0
        overlayView.alpha = 0
        overlayView.transform = .identity
        stackView.alpha = 0
        progressBarAnimate()
    }
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.alpha = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let onBoardingTextFood: UILabel = {
        let txt = UILabel()
        txt.textAlignment = .center
        txt.textColor = .white
        txt.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        txt.numberOfLines = 0
        txt.lineBreakMode = .byWordWrapping
        txt.layer.zPosition = 1
        txt.alpha = 0
        txt.text = "Tap and hold the packaging to pour the food, the longer you hold, the more food you pour. \nTap the food icon on the right menu to change the bowl"
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    let onBoardingTextBowl: UILabel = {
        let txt = UILabel()
        txt.textAlignment = .center
        txt.textColor = .white
        txt.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        txt.numberOfLines = 0
        txt.lineBreakMode = .byWordWrapping
        txt.layer.zPosition = 1
        txt.alpha = 0
        txt.text = "Drag and drop the bowl to feed the cat."
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    let onBoardingTextLamp: UILabel = {
        let txt = UILabel()
        txt.textAlignment = .center
        txt.textColor = .white
        txt.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        txt.numberOfLines = 0
        txt.lineBreakMode = .byWordWrapping
        txt.layer.zPosition = 1
        txt.alpha = 0
        txt.text = "Tap the lamp to lay the cat to sleep or to awake it."
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    let onBoardingTextPhone: UILabel = {
        let txt = UILabel()
        txt.textAlignment = .center
        txt.textColor = .white
        txt.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        txt.numberOfLines = 0
        txt.lineBreakMode = .byWordWrapping
        txt.layer.zPosition = 1
        txt.alpha = 0
        txt.text = "Tap the phone to make an appointment with a vet."
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    let onBoardingTextHand: UILabel = {
        let txt = UILabel()
        txt.textAlignment = .center
        txt.textColor = .white
        txt.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        txt.numberOfLines = 0
        txt.lineBreakMode = .byWordWrapping
        txt.layer.zPosition = 1
        txt.alpha = 0
        txt.text = "Drag the hand around to pet the cat."
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    //MARK: - Buttons
    
    //MARK: Back Button
    let backBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "Back-Icon"), for: .normal)
        btn.sizeThatFits(CGSize(width: 39, height: 39))
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(backBtnAction), for: .touchUpInside)
        return btn
    }()
    
    @objc func backBtnAction(sender: UIButton) {
        performSegue(withIdentifier: "unwind2MainGarden", sender: nil)
    }
    
    //MARK: Food Button
    let foodBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "Food-Icon"), for: .normal)
        btn.sizeThatFits(CGSize(width: 39, height: 39))
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(foodBtnAction), for: .touchUpInside)
        return btn
    }()
    
    @objc func foodBtnAction(sender: UIButton) {
        progressBarIcon.image = UIImage(named: "Food-Icon-ProgressBar")
        progressBar.setProgress(hunger, animated: true)
        progressBarAnimate()
        
        if sleepingState == true {
            catSleepingState()
        } else {
            if onBoardingFoodBefore == settingsDefaults.bool(forKey: Keys.onBoardingFood) {
                settingsDefaults.set(true, forKey: Keys.onBoardingFood)
                onBoardingStage = "food"
                onBoardingFood()
            }
            catNormal.isHidden = false
            catHand.isHidden = false
            bowl.isHidden = false
            catFood.isHidden = false
            catFood.alpha = 1
            sickPopUp.isHidden = true
            catSleeping.isHidden = true
            phone.alpha = 0
            handCare.isHidden = true
            lamp.alpha = 0

            switch bowlPresent {
            case true:
                catHandAnimation()
                bowlDown()
                bowlPresent = false
            default:
                catHandAnimation()
                bowlUp()
                bowlPresent = true
                currentTimer = 0
            }
        }
    }
    
    @objc func tapOverlay(sender: UITapGestureRecognizer) {
        switch onBoardingStage {
        case "food":
            onBoardingStage = "bowl"
            onBoardingBowl()
        case "bowl":
            overlay.alpha = 0
            bowl.layer.zPosition = 0
            bowl.layer.shadowColor = .none
            bowl.layer.shadowRadius = .zero
            bowl.layer.shadowOpacity = 0
            onBoardingTextBowl.alpha = 0
        case "sleep":
            overlay.alpha = 0
            lamp.layer.zPosition = 0
            lamp.layer.shadowColor = .none
            lamp.layer.shadowRadius = .zero
            lamp.layer.shadowOpacity = 0
            onBoardingTextLamp.alpha = 0
        case "health":
            overlay.alpha = 0
            phone.layer.zPosition = 0
            phone.layer.shadowColor = .none
            phone.layer.shadowRadius = .zero
            phone.layer.shadowOpacity = 0
            onBoardingTextPhone.alpha = 0
        case "love":
            overlay.alpha = 0
            handCare.layer.zPosition = 0
            handCare.layer.shadowColor = .none
            handCare.layer.shadowRadius = .zero
            handCare.layer.shadowOpacity = 0
            onBoardingTextHand.alpha = 0
        default:
            break
        }
    }
    
    //MARK: Zzz Button
    let zzzBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "Zzz-Icon"), for: .normal)
        btn.sizeThatFits(CGSize(width: 39, height: 39))
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(zzzBtnAction), for: .touchUpInside)
        return btn
    }()
    
    @objc func zzzBtnAction(sender: UIButton) {
        progressBarIcon.image = UIImage(systemName: "zzz")
        progressBarIcon.tintColor = UIColor(named: "413834")
        progressBar.setProgress(sleep, animated: true)
        progressBarAnimate()
        
            if sleepingState == true {
                catSleepingState()
                z1Animation()
                lampAnimation()
            } else {
                if onBoardingSleepBefore == settingsDefaults.bool(forKey: Keys.onBoardingSleep) {
                    settingsDefaults.set(true, forKey: Keys.onBoardingSleep)
                    onBoardingStage = "sleep"
                    onBoardingSleep()
                }
                catSleeping.isHidden = false
                catSleeping.image = UIImage(named: "Cat-Awake")
                catNormal.isHidden = true
                sickPopUp.isHidden = true
                bowl.isHidden = true
                catFood.isHidden = true
                catHand.isHidden = true
                handCare.isHidden = true
                phone.alpha = 0
                phone.transform = .identity
                lampAnimation()
            }
    }
    
    //MARK: Medical Button
    let medicalBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "Wave-Icon"), for: .normal)
        btn.sizeThatFits(CGSize(width: 39, height: 39))
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(medicalBtnAction), for: .touchUpInside)
        return btn
    }()
    
    @objc func medicalBtnAction(sender: UIButton) {
        if sleepingState == true {
            catSleepingState()
            progressBarIcon.image = UIImage(systemName: "waveform.path.ecg")
            progressBarIcon.tintColor = UIColor(named: "413834")
            progressBar.setProgress(health, animated: true)
            progressBarAnimate()
        } else {
            if onBoardingHealthBefore == settingsDefaults.bool(forKey: Keys.onBoardingHealth) {
                settingsDefaults.set(true, forKey: Keys.onBoardingHealth)
                onBoardingStage = "health"
                onBoardingHealth()
            }
            if hunger > 0 {
                health = 1
                settingsDefaults.set(health, forKey: Keys.health)
                catNormal.isHidden = true
                bowl.isHidden = true
                catFood.isHidden = true
                catHand.isHidden = true
                handCare.isHidden = true
                sickPopUp.isHidden = true
                catSleeping.isHidden = false
                catSleeping.image = #imageLiteral(resourceName: "Cat-Awake")
                phoneAnimation()
                lamp.alpha = 0
                overlaySleepingMode.alpha = 0
                progressBarIcon.image = UIImage(systemName: "waveform.path.ecg")
                progressBarIcon.tintColor = UIColor(named: "413834")
                progressBar.setProgress(health, animated: true)
                progressBarAnimate()
            } else {
                health = 0
                settingsDefaults.set(health, forKey: Keys.health)
                catNormal.isHidden = true
                bowl.isHidden = true
                catFood.isHidden = true
                catHand.isHidden = true
                handCare.isHidden = true
                sickPopUp.isHidden = false
                catSleeping.isHidden = false
                catSleeping.image = #imageLiteral(resourceName: "Cat-Awake")
                phoneAnimation()
                lamp.alpha = 0
                overlaySleepingMode.alpha = 0
                progressBarIcon.image = UIImage(systemName: "waveform.path.ecg")
                progressBarIcon.tintColor = UIColor(named: "413834")
                progressBar.setProgress(health, animated: true)
                progressBarAnimate()
            }
        }
    }
    
    //MARK: Game Button
    let gameBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "Game-Icon"), for: .normal)
        btn.sizeThatFits(CGSize(width: 39, height: 39))
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(gameBtnAction), for: .touchUpInside)
        return btn
    }()
    
    @objc func gameBtnAction(sender: UIButton) {
        if sleepingState == true {
            catSleepingState()
        } else {
            hunger -= 0.2
            settingsDefaults.set(hunger, forKey: Keys.hunger)
            sleep -= 0.2
            settingsDefaults.set(sleep, forKey: Keys.sleep)
            let storyboard = UIStoryboard(name: "TikusStoryboard", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "TikusViewController")
            self.present(vc, animated: true)
        }
    }
    
    //MARK: Care button
    let careBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "Hand-Icon"), for: .normal)
        btn.sizeThatFits(CGSize(width: 39, height: 39))
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(careBtnAction), for: .touchUpInside)
        return btn
    }()
    
    @objc func careBtnAction(sender: UIButton) {
        progressBarIcon.image = UIImage(systemName: "hand.raised.fill")
        progressBarIcon.tintColor = UIColor(named: "413834")
        progressBar.setProgress(love, animated: true)
        progressBarAnimate()
        
        if sleepingState == true {
            catSleepingState()
        } else {
            if onBoardingLoveBefore == settingsDefaults.bool(forKey: Keys.onBoardingLove) {
                settingsDefaults.set(true, forKey: Keys.onBoardingLove)
                onBoardingStage = "love"
                onBoardingLove()
            }
            catNormal.isHidden = false
            catHand.isHidden = false
            handCare.isHidden = false
            bowl.isHidden = true
            catFood.isHidden = true
            sickPopUp.isHidden = true
            catSleeping.isHidden = true
            phone.alpha = 0
            lamp.alpha = 0
            overlaySleepingMode.alpha = 0
        }
    }
    
    @IBAction func unwindToAnimalRoom(_ segue : UIStoryboardSegue) {
        let segueDes = segue.source as! TikusViewController
        print(segueDes.totalScore)
        let totalScoreGame = segueDes.totalScore * 2
        rewardsValue += totalScoreGame
        settingsDefaults.set(rewardsValue, forKey: Keys.rewards)
        DispatchQueue.main.async {
            self.rewardsLabel.text = "\(rewardsValue)"
        }
        fun = 1
        settingsDefaults.set(fun, forKey: Keys.fun)
        progressBarIcon.image = UIImage(systemName: "gamecontroller.fill")
        progressBarIcon.tintColor = UIColor(named: "413834")
        progressBar.setProgress(fun, animated: true)
        progressBarAnimate()
    }
    
    //MARK: - ViedDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.layout()
        
        catName = settingsDefaults.string(forKey: Keys.catName) ?? "Meoww"
        print("cat name = \(catName)")
        
        loadDefaults()
        if hunger < 0 {
            hunger = 0
        } else if sleep < 0 {
            sleep = 0
        } else if fun < 0 {
            fun = 0
        } else if love < 0 {
            love = 0
        }
        
        rewardsLabel.text = ("\(rewardsValue)")
        progressBar.setProgress(hunger, animated: true)
        
        let holdCatFood = UILongPressGestureRecognizer(target: self, action: #selector(catFoodTap))
        holdCatFood.minimumPressDuration = 0.3
        catFood.addGestureRecognizer(holdCatFood)
        
        let dragBowl = UIPanGestureRecognizer(target: self, action: #selector(bowlPan))
        bowl.addGestureRecognizer(dragBowl)
        
        let dragHandCare = UIPanGestureRecognizer(target: self, action: #selector(handCareDrag))
        handCare.addGestureRecognizer(dragHandCare)
        self.catPurrAudio()
       
        UNUserNotificationCenter.current().requestAuthorization(options: [.badge, .sound, .alert]) { (granted, error) in
            if granted {
                print("User granted notification")
            }
            
//            if granted == false {
//                let alert = UIAlertController(title: "Feeden Notification", message: "Allowing Feeden to notify you will result in how we remind you to take care of your pet. You may turn on the notification through Settings > Notifications > Feeden", preferredStyle: .alert)
//                let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
//                alert.addAction(action)
//                self.present(alert, animated: true)
//            }
        }
        
        notification()
        
    }
}
