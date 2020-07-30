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
    
    var rewardsValue: Int = 100
    let bowlIcons: [UIImage] = [#imageLiteral(resourceName: "Bowl-Empty"), #imageLiteral(resourceName: "Bowl-Half"), #imageLiteral(resourceName: "Bowl-Full"), #imageLiteral(resourceName: "Bowl-Excess")]
    var bowlPresent: Bool = false
    var timer: Timer?
    var currentTimer: Int = 0
    let emitterLayer = CAEmitterLayer()
    var intersectNumber: Int = 0
    var catPurr: AVAudioPlayer?
    let otherVC = OtherVC()
    var sleepingState: Bool = false
    
    //MARK: Logic
    var hunger: Float = 0.0
    var sleep: Float = 0.0
    var health: Float = 0.0
    var fun: Float = 0.0
    var love: Float = 0.0
    
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
            rewardsValue += 10
            DispatchQueue.main.async {
                self.rewardsLabel.text = "\(self.rewardsValue)"
            }
            
            self.z1Animation()
            
            let attributedTextFull = NSMutableAttributedString(
                string: "Meoww is sleeping!",
                attributes: [NSAttributedString.Key.font : UIFont(name: "HappyMonkey-Regular", size: 20)!])
            attributedTextFull.append(NSAttributedString(
                string: "\n\nYou earned $10 for giving Meoww time to sleep. Come back later to play with Meoww again.",
                attributes: [NSAttributedString.Key.font : UIFont(name: "ChalkboardSE-Bold", size: 15)!]))
            overlayText.attributedText = attributedTextFull
            overlayText.textAlignment = .center
            self.overlayAnimation()
            overlaySleepingMode.alpha = 1
            
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerSleeping), userInfo: nil, repeats: true)
            
        } else {
            sleepingState = false
            catSleeping.isHidden = true
            catNormal.isHidden = false
            overlaySleepingMode.alpha = 0
            zPopUp1.isHidden = true
            zPopUp2.isHidden = true
            zPopUp3.isHidden = true
            timer?.invalidate()
        }

    }
    
    @objc func timerSleeping() {
        currentTimer += 1
        switch currentTimer {
        case 3:
            sleep += 0.3
        case 5:
            sleep += 0.5
        case 8:
            sleep += 0.2
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
        health = 1
        progressBar.setProgress(health, animated: true)
        if let phoneURL = NSURL(string: ("tel://911")) {
            UIApplication.shared.open(phoneURL as URL, options: [:], completionHandler: nil)
        }
        let attributedTextFull = NSMutableAttributedString(
            string: "Meoww is sick!",
            attributes: [NSAttributedString.Key.font : UIFont(name: "HappyMonkey-Regular", size: 20)!])
        attributedTextFull.append(NSAttributedString(
            string: "\n\nYou just called the vet to make an appointment for Meoww.",
            attributes: [NSAttributedString.Key.font : UIFont(name: "ChalkboardSE-Bold", size: 15)!]))
        overlayText.attributedText = attributedTextFull
        overlayText.textAlignment = .center
        self.overlayAnimation()
        
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
        print("catFood got pressed")
        switch sender.state {
            
        case .began:
            catFoodAnimateStart()
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
        case 2:
            DispatchQueue.main.async {
                self.bowl.image = self.bowlIcons[1]
            }
        case 4:
            DispatchQueue.main.async {
                self.bowl.image = self.bowlIcons[2]
            }
        case 6:
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
                        progressBarAnimate()
                        progressBar.setProgress(hunger, animated: true)
                    case bowlIcons[2]:
                        hunger += 0.2
                        progressBarAnimate()
                        progressBar.setProgress(hunger, animated: true)
                    case bowlIcons[3]:
                        hunger += 0.3
                        progressBarAnimate()
                        progressBar.setProgress(hunger, animated: true)
                    default:
                        break
                    }
                    
                    bowl.image = bowlIcons[0]
                    if hunger >= 1 {
                        rewardsValue += 10
                        DispatchQueue.main.async {
                            self.rewardsLabel.text = ("\(self.rewardsValue)")
                        }
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
                    let attributedTextFull = NSMutableAttributedString(string: "Meoww is full!", attributes: [NSAttributedString.Key.font : UIFont(name: "HappyMonkey-Regular", size: 20)!])
                    attributedTextFull.append(NSAttributedString(string: "\n\nYou earned $10 for giving Meoww the right amount of food. Play game with Meoww to burn its calories.", attributes: [NSAttributedString.Key.font : UIFont(name: "ChalkboardSE-Bold", size: 15)!]))
                    overlayText.attributedText = attributedTextFull
                    overlayText.textAlignment = .center
                    overlayAnimation()
                }
                
            }
        case .ended:
            print("touch ended")
            currentTimer = 0
            if bowl.layer.position != CGPoint(x: 165.5, y: 460) {
                UIView.animate(
                    withDuration: 0.5,
                    delay: 0,
                    options: .curveEaseOut,
                    animations: {
                        self.bowl.layer.position = CGPoint(x: 165.5, y: 460)
                },
                    completion: nil)
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
                    catPurr?.play()
                    love += 0.001
                    if love >= 1 {
                        rewardsValue += 10
                        DispatchQueue.main.async {
                            self.rewardsLabel.text = ("\(self.rewardsValue)")
                        }
                    }
                } else {
                    let attributedTextFull = NSMutableAttributedString(string: "Meoww is happy!", attributes: [NSAttributedString.Key.font : UIFont(name: "HappyMonkey-Regular", size: 20)!])
                    attributedTextFull.append(NSAttributedString(string: "\n\nYou earned $10 for giving Meoww the right amount of love.", attributes: [NSAttributedString.Key.font : UIFont(name: "ChalkboardSE-Bold", size: 15)!]))
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
        let attributedText = NSMutableAttributedString(string: "Meoww is sick!", attributes: [NSAttributedString.Key.font : UIFont(name: "HappyMonkey-Regular", size: 20)!])
        attributedText.append(NSAttributedString(string: "\n\nYou just called the vet to make an appointment for Meoww.", attributes: [NSAttributedString.Key.font : UIFont(name: "ChalkboardSE-Bold", size: 15)!]))
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
        //TODO: How to adjust the button size to be smaller than the stackview size
        //        btn.frame = CGRect(x: 0, y: 0, width: 128, height: 39)
        //        btn.sizeThatFits(CGSize(width: 128, height: 39))
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
        print("back button tapped")
        present(otherVC, animated: true, completion: nil)
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
        print("zzz button tapped")
        progressBarIcon.image = UIImage(systemName: "zzz")
        progressBarIcon.tintColor = UIColor(named: "413834")
        progressBar.setProgress(sleep, animated: true)
        progressBarAnimate()
        
            if sleepingState == true {
                catSleepingState()
                z1Animation()
                lampAnimation()
            } else {
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
        print("medical button tapped")
        progressBarIcon.image = UIImage(systemName: "waveform.path.ecg")
        progressBarIcon.tintColor = UIColor(named: "413834")
        progressBar.setProgress(health, animated: true)
        progressBarAnimate()
        
        if sleepingState == true {
            catSleepingState()
        } else {
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
        let storyboard = UIStoryboard(name: "TikusStoryboard", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "TikusViewController")
        self.present(vc, animated: true)
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
        print("care button tapped")
        
        progressBarIcon.image = UIImage(systemName: "hand.raised.fill")
        progressBarIcon.tintColor = UIColor(named: "413834")
        progressBar.setProgress(love, animated: true)
        progressBarAnimate()
        
        if sleepingState == true {
            catSleepingState()
        } else {
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
    
    
    //MARK: - ViedDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.layout()
        rewardsLabel.text = ("\(rewardsValue)")
        
        progressBar.setProgress(hunger, animated: true)
        
        let holdCatFood = UILongPressGestureRecognizer(target: self, action: #selector(catFoodTap))
        holdCatFood.minimumPressDuration = 0.1
        catFood.addGestureRecognizer(holdCatFood)
        let dragBowl = UIPanGestureRecognizer(target: self, action: #selector(bowlPan))
        bowl.addGestureRecognizer(dragBowl)
        let dragHandCare = UIPanGestureRecognizer(target: self, action: #selector(handCareDrag))
        handCare.addGestureRecognizer(dragHandCare)
        self.catPurrAudio()
    }
}
