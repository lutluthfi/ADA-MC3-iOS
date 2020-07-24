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
    var hunger: Double = 0
    var sleep: Double = 0
    var health: Double = 0
    var fun: Double = 0
    var love: Double = 0
    
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
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let zPopUp2: UIImageView = {
        let img = UIImageView()
        img.image = #imageLiteral(resourceName: "Z")
        img.alpha = 0
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let zPopUp3: UIImageView = {
        let img = UIImageView()
        img.image = #imageLiteral(resourceName: "Z")
        img.alpha = 0
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
        if let phoneURL = NSURL(string: ("tel://911")) {
            UIApplication.shared.open(phoneURL as URL, options: [:], completionHandler: nil)
        }
        overlayAnimation()
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
                if hunger < 0.3 {
                    switch bowl.image {
                    case bowlIcons[1]:
                        hunger += 0.1
                    case bowlIcons[2]:
                        hunger += 0.2
                    case bowlIcons[3]:
                        hunger += 0.3
                    default:
                        break
                    }
                
                    bowl.image = bowlIcons[0]
                    if hunger >= 0.3 {
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
                
                if love < 0.8 {
                    catPurr?.play()
                    love += 0.001
                    if love >= 0.8 {
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
        catNormal.isHidden = false
        catHand.isHidden = false
        bowl.isHidden = false
        catFood.isHidden = false
        sickPopUp.isHidden = true
        catSleeping.isHidden = true
        phone.alpha = 0
        phone.transform = .identity
        handCare.isHidden = true
        
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
        catNormal.isHidden = true
        sickPopUp.isHidden = true
        bowl.isHidden = true
        catFood.isHidden = true
        catHand.isHidden = true
        handCare.isHidden = true
        phone.alpha = 0
        phone.transform = .identity
        catSleeping.isHidden = false
        catSleeping.image = #imageLiteral(resourceName: "Cat-Sleeping")

        z1Animation()
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
        catNormal.isHidden = true
        bowl.isHidden = true
        catFood.isHidden = true
        catHand.isHidden = true
        handCare.isHidden = true
        sickPopUp.isHidden = false
        catSleeping.isHidden = false
        catSleeping.image = #imageLiteral(resourceName: "Cat-Awake")
        phoneAnimation()
        //TODO: fix the corresponding image sizes
        /*catSleepingZzz.widthAnchor.constraint(equalToConstant: 87).isActive = true
         catSleepingZzz.heightAnchor.constraint(equalToConstant: 66).isActive = true
         catSleepingZzz.frame.size = CGSize(width: 87, height: 66)
         catSleepingZzz.layer.frame.size = CGSize(width: 87, height: 66)*/
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
        print("game button tapped")
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
        catNormal.isHidden = false
        catHand.isHidden = false
        handCare.isHidden = false
        bowl.isHidden = true
        catFood.isHidden = true
        sickPopUp.isHidden = true
        catSleeping.isHidden = true
        phone.alpha = 0
        phone.transform = .identity
    }
    
    
    //MARK: - ViedDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        rewardsLabel.text = ("\(rewardsValue)")
        
        let holdCatFood = UILongPressGestureRecognizer(target: self, action: #selector(catFoodTap))
        holdCatFood.minimumPressDuration = 0.1
        catFood.addGestureRecognizer(holdCatFood)
        let dragBowl = UIPanGestureRecognizer(target: self, action: #selector(bowlPan))
        bowl.addGestureRecognizer(dragBowl)
        let dragHandCare = UIPanGestureRecognizer(target: self, action: #selector(handCareDrag))
        handCare.addGestureRecognizer(dragHandCare)
        catPurrAudio()
    }
    
    //MARK: - Functions
    
    fileprivate func bowlUp() {
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            options: [.curveEaseInOut],
            animations: {
                self.bowl.transform = CGAffineTransform(translationX: 0, y: -120)
                self.catFood.alpha = 1
        },
            completion: nil)
//        print("bowl position = \(bowl.layer.position)") (165.5, 460.0)
    }
    
    fileprivate func bowlDown() {
        UIView.animate(
            withDuration: 0.5,
            delay: 0.5,
            options: [.curveEaseInOut],
            animations: {
                self.bowl.transform = .identity
        },
            completion: nil)
    }
    
    fileprivate func catHandAnimation() {
        switch bowlPresent {
        case false:
            bowl.image = bowlIcons[0]
        default:
            break
        }
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            options: [.curveEaseInOut],
            animations: {
                self.catHand.transform = CGAffineTransform(translationX: 0, y: -100)
        }) { (finished) in
            UIView.animate(
                withDuration: 0.5,
                delay: 0,
                options: [.curveEaseInOut],
                animations: {
                    self.catHand.transform = .identity
            },
                completion: nil)
        }
    }
    
    fileprivate func catFoodAnimateStart() {
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            options: [.curveEaseInOut],
            animations: {
                self.catFood.transform = CGAffineTransform(rotationAngle: 20)
        }) { (finished) in
            self.emitter()
        }
    }
    
    fileprivate func catFoodAnimateStop() {
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            options: [.curveEaseInOut],
            animations: {
                self.catFood.transform = .identity
        }, completion: nil)
    }
    
    fileprivate func z1Animation() {
        UIView.animate(
            withDuration: 1,
            delay: 0,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 5,
            options: [],
            animations: {
                self.zPopUp1.alpha = 1
                self.zPopUp1.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        }) { (finished) in
            self.z2Animation()
        }
    }
    
    fileprivate func z2Animation() {
        UIView.animate(
            withDuration: 1,
            delay: 0,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 5,
            options: [],
            animations: {
                self.zPopUp2.alpha = 1
                self.zPopUp2.transform = CGAffineTransform(scaleX: 2, y: 2)
        }) { (finished) in
            self.z3Animation()
        }
    }
    
    fileprivate func z3Animation() {
        UIView.animate(
            withDuration: 1,
            delay: 0,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 5,
            options: [],
            animations: {
                self.zPopUp3.alpha = 1
                self.zPopUp3.transform = CGAffineTransform(scaleX: 2.5, y: 2.5)
        }) { (finished) in
            self.zAnimationOff()
        }
    }
    
    fileprivate func zAnimationOff() {
        UIView.animate(
            withDuration: 1,
            delay: 2,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 5,
            options: [],
            animations: {
                self.zPopUp1.transform = .identity
                self.zPopUp1.alpha = 0
                self.zPopUp2.transform = .identity
                self.zPopUp2.alpha = 0
                self.zPopUp3.transform = .identity
                self.zPopUp3.alpha = 0
        },
            completion: nil)
    }
    
    fileprivate func phoneAnimation() {
        UIView.animate(
            withDuration: 1,
            delay: 0,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 5,
            options: [],
            animations: {
                self.phone.alpha = 1
                self.phone.transform = CGAffineTransform(scaleX: 7, y: 7)
        },
            completion: nil)
    }
    
    fileprivate func overlayAnimation() {
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            usingSpringWithDamping: 0.8,
            initialSpringVelocity: 5,
            options: [],
            animations: {
                self.overlay.alpha = 1
                self.overlayView.alpha = 1
                self.overlayView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5) //scale size (264.25, 68.25, 367.5, 277.5)
                self.stackView.alpha = 1
        },
            completion: nil)
    }
    
    fileprivate func emitter() {
        emitterLayer.emitterPosition = CGPoint(x: catFood.frame.maxX - 20, y: catFood.frame.midY)
        
        let cell = CAEmitterCell()
        cell.birthRate = 1
        cell.lifetime = 10
        cell.velocity = 60
        cell.emissionLongitude = (180 * (.pi / 180))
        cell.emissionRange = (45 * (.pi / 180))
        cell.contents = UIImage(named: "Cat-Food-1")!.cgImage
        
        let cell2 = CAEmitterCell()
        cell2.birthRate = 2
        cell2.lifetime = 10
        cell2.velocity = 100
        cell2.emissionLongitude = (180 * (.pi / 180))
        cell2.emissionRange = (45 * (.pi / 180))
        cell2.contents = UIImage(named: "Cat-Food-2")!.cgImage
        
        let cell3 = CAEmitterCell()
        cell3.birthRate = 5
        cell3.lifetime = 10
        cell3.velocity = 150
        cell3.scale = 0.8
        cell3.emissionLongitude = (180 * (.pi / 180))
        cell3.emissionRange = (45 * (.pi / 180))
        cell3.contents = UIImage(named: "Cat-Food-4")!.cgImage
        
        emitterLayer.emitterShape = CAEmitterLayerEmitterShape.line
        emitterLayer.emitterCells = [cell, cell2, cell3]
        
        view.layer.addSublayer(emitterLayer)
    }
    
    func catPurrAudio() {
        let path = Bundle.main.path(forResource: "Cat-Purr", ofType: "mp3")!
        let url = URL(fileURLWithPath: path)
        
        do {
            catPurr = try AVAudioPlayer(contentsOf: url)
        } catch  {
            print(Error.self)
        }
    }
    
    func layout() {
        view.addSubview(background)
        view.addSubview(basket)
        view.addSubview(catNormal)
        view.addSubview(catSleeping)
        view.addSubview(sickPopUp)
        view.addSubview(zPopUp1)
        view.addSubview(zPopUp2)
        view.addSubview(zPopUp3)
        view.addSubview(backBtn)
        view.addSubview(rewardsContainer)
        view.addSubview(rewardsLabel)
        view.addSubview(bowl)
        view.addSubview(catFood)
        view.addSubview(phone)
        view.addSubview(catHand)
        view.addSubview(foodBtn)
        view.addSubview(zzzBtn)
        view.addSubview(medicalBtn)
        view.addSubview(gameBtn)
        view.addSubview(careBtn)
        view.addSubview(handCare)
        
        view.addSubview(overlay)
        view.addSubview(overlayView)
        view.addSubview(stackView)
        stackView.addArrangedSubview(overlayText)
        stackView.addArrangedSubview(overlayBtn)

        NSLayoutConstraint.activate([
            //MARK: - Item layout
            background.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            background.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            basket.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 40),
            basket.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: +50),
            basket.widthAnchor.constraint(equalToConstant: 395),
            basket.heightAnchor.constraint(equalToConstant: 235),
            
            catNormal.centerXAnchor.constraint(equalTo: basket.centerXAnchor),
            catNormal.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -30),
            
            catSleeping.centerXAnchor.constraint(equalTo: catNormal.centerXAnchor),
            catSleeping.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 20),
            
            sickPopUp.centerXAnchor.constraint(equalTo: basket.centerXAnchor, constant: 30),
            sickPopUp.bottomAnchor.constraint(equalTo: basket.topAnchor),
            
            zPopUp1.bottomAnchor.constraint(equalTo: basket.topAnchor),
            zPopUp1.trailingAnchor.constraint(equalTo: basket.trailingAnchor, constant: -100),
            zPopUp1.widthAnchor.constraint(equalToConstant: 39),
            zPopUp1.heightAnchor.constraint(equalToConstant: 49),
            
            zPopUp2.bottomAnchor.constraint(equalTo: zPopUp1.bottomAnchor, constant: -20),
            zPopUp2.trailingAnchor.constraint(equalTo: zPopUp1.leadingAnchor, constant: -20),
            zPopUp2.widthAnchor.constraint(equalTo: zPopUp1.widthAnchor),
            zPopUp2.heightAnchor.constraint(equalTo: zPopUp1.heightAnchor),
            
            zPopUp3.bottomAnchor.constraint(equalTo: zPopUp2.bottomAnchor, constant: -20),
            zPopUp3.trailingAnchor.constraint(equalTo: zPopUp2.leadingAnchor, constant: -20),
            zPopUp3.widthAnchor.constraint(equalTo: zPopUp1.widthAnchor),
            zPopUp3.heightAnchor.constraint(equalTo: zPopUp1.heightAnchor),
            
            backBtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            backBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            
            rewardsContainer.topAnchor.constraint(equalTo: backBtn.topAnchor),
            rewardsContainer.leadingAnchor.constraint(equalTo: backBtn.trailingAnchor, constant: 15),
            
            rewardsLabel.centerYAnchor.constraint(equalTo: rewardsContainer.centerYAnchor),
            rewardsLabel.trailingAnchor.constraint(equalTo: rewardsContainer.trailingAnchor, constant: -15),
            
            catHand.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 80),
            catHand.topAnchor.constraint(equalTo: view.bottomAnchor),
            
            catFood.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -25),
            catFood.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            catFood.widthAnchor.constraint(equalToConstant: 123.08),
            catFood.heightAnchor.constraint(equalToConstant: 136.6),
            
            bowl.topAnchor.constraint(equalTo: view.bottomAnchor),
            bowl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60),
            bowl.widthAnchor.constraint(equalToConstant: 163),
            bowl.heightAnchor.constraint(equalToConstant: 92),
            
            phone.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 70),
            phone.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 100),
            phone.widthAnchor.constraint(equalToConstant: 22),
            phone.heightAnchor.constraint(equalToConstant: 19),
            
            handCare.centerYAnchor.constraint(equalTo: phone.centerYAnchor),
            handCare.leadingAnchor.constraint(equalTo: phone.leadingAnchor),
            handCare.widthAnchor.constraint(equalToConstant: 122),
            handCare.heightAnchor.constraint(equalToConstant: 126),
            
            //MARK: - Button Layout
            foodBtn.topAnchor.constraint(equalTo: backBtn.topAnchor),
            foodBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            zzzBtn.topAnchor.constraint(equalTo: foodBtn.bottomAnchor, constant: 20),
            zzzBtn.trailingAnchor.constraint(equalTo: foodBtn.trailingAnchor),
            
            medicalBtn.topAnchor.constraint(equalTo: zzzBtn.bottomAnchor, constant: 20),
            medicalBtn.trailingAnchor.constraint(equalTo: foodBtn.trailingAnchor),
            
            gameBtn.topAnchor.constraint(equalTo: medicalBtn.bottomAnchor, constant: 20),
            gameBtn.trailingAnchor.constraint(equalTo: foodBtn.trailingAnchor),
            
            careBtn.topAnchor.constraint(equalTo: gameBtn.bottomAnchor, constant: 20),
            careBtn.trailingAnchor.constraint(equalTo: foodBtn.trailingAnchor),
            
            //MARK: - Overlay
            overlay.widthAnchor.constraint(equalTo: view.widthAnchor),
            overlay.heightAnchor.constraint(equalTo: view.heightAnchor),
            overlay.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            overlay.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            overlayView.widthAnchor.constraint(equalToConstant: 367/1.5),
            overlayView.heightAnchor.constraint(equalToConstant: 278/1.5),
            overlayView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            overlayView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 300),
            stackView.heightAnchor.constraint(equalToConstant: 210)
        ])
    }
}
