//
//  AnimalRoomVC.swift
//  MC3
//
//  Created by Muhammad Faruuq Qayyum on 16/07/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class AnimalRoomVC: UIViewController {
    
    var rewardsValue: Int = 35000
    let bowlIcons: [UIImage] = [#imageLiteral(resourceName: "Bowl-Empty"), #imageLiteral(resourceName: "Bowl-Half"), #imageLiteral(resourceName: "Bowl-Full"), #imageLiteral(resourceName: "Bowl-Excess")]
    let bowlStatus: [String] = ["initiate", "half", "full", "excess"]
    var currentBowl: String = "initiate"
    
    
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
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    //MARK: Cat Pop Up
    let catPopUp: UIImageView = {
        let img = UIImageView()
        img.image = #imageLiteral(resourceName: "Zzz")
        img.frame.size = CGSize(width: 39, height: 39)
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()

    //MARK: Cat Hand
    let catHand: UIImageView = {
        let img = UIImageView()
        img.image = #imageLiteral(resourceName: "Cat-Hand")
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()

    //MARK: Bowl
    var bowl: UIImageView = {
        let img = UIImageView()
        img.image = #imageLiteral(resourceName: "Bowl-Half")
        img.isUserInteractionEnabled = true
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    @objc func bowlPan(sender: UIPanGestureRecognizer) {
        view.bringSubviewToFront(bowl)
        let translation = sender.translation(in: self.view)
        switch sender.state {
        case .began, .changed:
            bowl.center = CGPoint(x: bowl.center.x + translation.x, y: bowl.center.y + translation.y)
            sender.setTranslation(CGPoint.zero, in: self.view)
        case .ended:
            print("touch ended")
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
        label.font = UIFont(name: "ChalkboardSE-Bold", size: 20)
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
    
    let overlayText: UITextView = {
        let txt = UITextView()
        let attributedText = NSMutableAttributedString(string: "Meoww is sick!", attributes: [NSAttributedString.Key.font : UIFont(name: "ChalkboardSE-Bold", size: 20)!])
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
        btn.titleLabel?.font = UIFont(name: "ChalkboardSE-Bold", size: 20)
        btn.tintColor = .white
        btn.layer.cornerRadius = 5
        //TODO: How to adjust the button size to be smaller than the stackview size
//        btn.frame = CGRect(x: 0, y: 0, width: 128, height: 39)
//        btn.sizeThatFits(CGSize(width: 128, height: 39))
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(overlayAction), for: .touchUpInside)
        return btn
    }()
    
    @objc func overlayAction(sender: UIButton) {
        overlay.isHidden = true
        overlayView.isHidden = true
        overlayView.transform = .identity
        stackView.isHidden = true
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
        catPopUp.isHidden = true
        catSleeping.isHidden = true
        phone.isHidden = true
        phone.transform = .identity
        
        switch self.currentBowl {
        case bowlStatus[0]:
            catHandAnimation(delay: 0)
            bowlAnimationUp(duration: 1, delay: 0)
            currentBowl = bowlStatus[1]
        case bowlStatus[1]:
            catHandAnimation(delay: 0)
            bowlAnimationDown(image: bowlIcons[2])
            currentBowl = bowlStatus[2]
        case bowlStatus[2]:
            catHandAnimation(delay: 0)
            bowlAnimationDown(image: bowlIcons[3])
            currentBowl = bowlStatus[3]
        case bowlStatus[3]:
            catHandAnimation(delay: 0)
            bowlAnimationDown(image: bowlIcons[1])
            currentBowl = bowlStatus[1]
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
        print("zzz button tapped")
        catNormal.isHidden = true
        bowl.isHidden = true
        catHand.isHidden = true
        phone.isHidden = true
        phone.transform = .identity
        catSleeping.isHidden = false
        catPopUp.isHidden = false
        catPopUp.image = #imageLiteral(resourceName: "Zzz")
        catSleeping.image = #imageLiteral(resourceName: "Cat-Sleeping")
        //TODO: fix the corresponding image sizes
        /*catSleepingZzz.frame.size = CGSize(width: 159, height: 107)
        catSleepingZzz.layer.frame.size = CGSize(width: 159, height: 107)
        catSleepingZzz.widthAnchor.constraint(equalToConstant: 159).isActive = true
        catSleepingZzz.heightAnchor.constraint(equalToConstant: 107).isActive = true*/
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
        catHand.isHidden = true
        catPopUp.isHidden = false
        catSleeping.isHidden = false
        phone.isHidden = false
        catSleeping.image = #imageLiteral(resourceName: "Cat-Awake")
        catPopUp.image = #imageLiteral(resourceName: "Baloon-Energy")
        phoneAnimation()
        //TODO: fix the corresponding image sizes
        /*catSleepingZzz.widthAnchor.constraint(equalToConstant: 87).isActive = true
         catSleepingZzz.heightAnchor.constraint(equalToConstant: 66).isActive = true
         catSleepingZzz.frame.size = CGSize(width: 87, height: 66)
         catSleepingZzz.layer.frame.size = CGSize(width: 87, height: 66)*/
        
    }
    
    //MARK: Phone Button
    let phone: UIButton = {
        let btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "Phone"), for: .normal)
        btn.alpha = 0.3
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
    }
    
    
    //MARK: - ViedDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        rewardsLabel.text = ("\(rewardsValue)")
        catSleeping.isHidden = true
        catPopUp.isHidden = true
        phone.isHidden = true
        
        overlay.isHidden = true
        overlayView.isHidden = true
        stackView.isHidden = true
    
        let pan = UIPanGestureRecognizer(target: self, action: #selector(bowlPan))
        bowl.addGestureRecognizer(pan)
        
        emitter()
    }
    
    //MARK: - Functions
    fileprivate func bowlAnimationUp(duration: Double, delay: Double) {
        UIView.animate(
            withDuration: duration,
            delay: delay,
            options: [.curveEaseInOut],
            animations: {
                self.bowl.transform = CGAffineTransform(translationX: 0, y: -160)
        },
            completion: nil)
        //TODO: How to make it collision
    }
    
    fileprivate func bowlAnimationDown(image: UIImage) {
        UIView.animate(
            withDuration: 1.2,
            delay: 1.05,
            options: [.curveEaseIn],
            animations: {
                self.bowl.transform = CGAffineTransform(translationX: 0, y: 160)
        },
            completion: { done in
                self.bowl.image = image
                self.catHandAnimation(delay: 0.5)
                self.bowlAnimationUp(duration: 1.5, delay: 0)
        })
    }
    
    fileprivate func catHandAnimation(delay: Double) {
        UIView.animate(
            withDuration: 1,
            delay: delay,
            options: [.autoreverse],
            animations: {
                self.catHand.transform = CGAffineTransform(translationX: 0, y: -160)
        }) { (catHandCompletedAction) in
            self.catHand.transform = .identity
        }
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
                self.overlay.isHidden = false
                self.overlay.alpha = 1
                self.overlayView.isHidden = false
                self.overlayView.alpha = 1
                self.overlayView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5) //scale size (264.25, 68.25, 367.5, 277.5)
                self.stackView.alpha = 1
                self.stackView.isHidden = false
        },
            completion: nil)
    }
    
    fileprivate func emitter() {
        let emitterLayer = CAEmitterLayer()
        emitterLayer.emitterPosition = CGPoint(x: 320, y: 320)
        
        let cell = CAEmitterCell()
        cell.birthRate = 70
        cell.lifetime = 5
        cell.velocity = 100
        cell.scale = 0.1
        cell.emissionLongitude = (180 * (.pi / 180))
        cell.emissionRange = (45 * (.pi / 180))
        cell.contents = UIImage(named: "Baloon")!.cgImage
        
        emitterLayer.emitterShape = CAEmitterLayerEmitterShape.line
        emitterLayer.emitterCells = [cell]
        
        view.layer.addSublayer(emitterLayer)
    }
    
    func layout() {
        view.addSubview(background)
        view.addSubview(basket)
        view.addSubview(catNormal)
        view.addSubview(catSleeping)
        view.addSubview(catPopUp)
        view.addSubview(backBtn)
        view.addSubview(rewardsContainer)
        view.addSubview(rewardsLabel)
        view.addSubview(bowl)
        view.addSubview(phone)
        view.addSubview(catHand)
        view.addSubview(foodBtn)
        view.addSubview(zzzBtn)
        view.addSubview(medicalBtn)
        view.addSubview(gameBtn)
        view.addSubview(careBtn)
        
        view.addSubview(overlay)
        view.addSubview(overlayView)
        view.addSubview(stackView)
        stackView.addArrangedSubview(overlayText)
        stackView.addArrangedSubview(overlayBtn)
        
        
        
        NSLayoutConstraint.activate([
            //MARK: - Item layout
            background.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            background.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            basket.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            basket.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: +50),
            basket.widthAnchor.constraint(equalToConstant: 395),
            basket.heightAnchor.constraint(equalToConstant: 235),
            
            catNormal.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            catNormal.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -30),
            
            catSleeping.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            catSleeping.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 20),
            catPopUp.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 30),
            catPopUp.bottomAnchor.constraint(equalTo: basket.topAnchor),
            //TODO: Setting constrains for catPopUp properly
//            catSleepingZzz.heightAnchor.constraint(equalToConstant: 107),
//            catSleepingZzz.widthAnchor.constraint(equalToConstant: 159),
            
            backBtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            backBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            
            rewardsContainer.topAnchor.constraint(equalTo: backBtn.topAnchor),
            rewardsContainer.leadingAnchor.constraint(equalTo: backBtn.trailingAnchor, constant: 15),
            
            rewardsLabel.centerYAnchor.constraint(equalTo: rewardsContainer.centerYAnchor),
            rewardsLabel.trailingAnchor.constraint(equalTo: rewardsContainer.trailingAnchor, constant: -15),
            
            catHand.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            catHand.topAnchor.constraint(equalTo: view.bottomAnchor),
            
            bowl.topAnchor.constraint(equalTo: view.bottomAnchor),
            bowl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            bowl.widthAnchor.constraint(equalToConstant: 163),
            bowl.heightAnchor.constraint(equalToConstant: 92),
            
            phone.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 70),
            phone.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 100),
            phone.widthAnchor.constraint(equalToConstant: 22),
            phone.heightAnchor.constraint(equalToConstant: 19),
            
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
