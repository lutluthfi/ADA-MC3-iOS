//
//  AnimalRoomVC+Extension.swift
//  MC3
//
//  Created by Muhammad Faruuq Qayyum on 25/07/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//
import AVFoundation
import UIKit

extension AnimalRoomVC {
    
    func bowlUp() {
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
    
    func bowlDown() {
        UIView.animate(
            withDuration: 0.5,
            delay: 0.5,
            options: [.curveEaseInOut],
            animations: {
                self.bowl.transform = .identity
        },
            completion: nil)
    }
    
    func catHandAnimation() {
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
    
    func catFoodAnimateStart() {
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
    
    func catFoodAnimateStop() {
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            options: [.curveEaseInOut],
            animations: {
                self.catFood.transform = .identity
        }, completion: nil)
    }
    
    func z1Animation() {
        zPopUp1.isHidden = false
        zPopUp2.isHidden = false
        zPopUp3.isHidden = false
        zPopUp1.transform = CGAffineTransform(scaleX: .zero, y: .zero)
        UIView.animate(
            withDuration: 1,
            delay: 0,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 5,
            options: [],
            animations: {
                self.zPopUp1.alpha = 1
                self.zPopUp1.transform = .identity
        }) { (finished) in
            self.z2Animation()
        }
    }
    
    func z2Animation() {
        zPopUp2.transform = CGAffineTransform(scaleX: .zero, y: .zero)
        UIView.animate(
            withDuration: 1,
            delay: 0,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 5,
            options: [],
            animations: {
                self.zPopUp2.alpha = 1
                self.zPopUp2.transform = .identity
        }) { (finished) in
            self.z3Animation()
        }
    }
    
    func z3Animation() {
        zPopUp3.transform = CGAffineTransform(scaleX: .zero, y: .zero)
        UIView.animate(
            withDuration: 1,
            delay: 0,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 5,
            options: [],
            animations: {
                self.zPopUp3.alpha = 1
                self.zPopUp3.transform = .identity
        }) { (finished) in
            self.zAnimationOff()
        }
    }
    
    func zAnimationOff() {
        UIView.animate(
            withDuration: 1,
            delay: 1,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 5,
            options: [],
            animations: {
                self.zPopUp1.alpha = 0
                self.zPopUp2.alpha = 0
                self.zPopUp3.alpha = 0
        },
            completion: nil)
    }
    
    func lampAnimation() {
        lamp.transform = CGAffineTransform(scaleX: .zero, y: .zero)
        UIView.animate(
            withDuration: 1,
            delay: 0,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 5,
            options: [],
            animations: {
                self.lamp.alpha = 1
                self.lamp.transform = .identity
        },
            completion: nil)
    }
    
    func phoneAnimation() {
        phone.transform = CGAffineTransform(scaleX: .zero, y: .zero)
        UIView.animate(
            withDuration: 1,
            delay: 0,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 5,
            options: [],
            animations: {
                self.phone.alpha = 1
                self.phone.transform = .identity
        },
            completion: nil)
    }
    
    func overlayAnimation() {
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
    
    func catPurrAudio() {
        let path = Bundle.main.path(forResource: "Cat-Purr", ofType: "mp3")!
        let url = URL(fileURLWithPath: path)
        
        do {
            catPurr = try AVAudioPlayer(contentsOf: url)
        } catch  {
            print(Error.self)
        }
    }
    
    func catSleepingState () {
        catSleeping.isHidden = false
        catSleeping.image = UIImage(named: "Cat-Sleeping")
        overlaySleepingMode.alpha = 1
        catNormal.isHidden = true
        bowl.isHidden = true
        catHand.isHidden = true
        catFood.alpha = 0
        handCare.isHidden = true
        phone.alpha = 0
        lamp.alpha = 0
        zPopUp1.isHidden = true
        zPopUp2.isHidden = true
        zPopUp3.isHidden = true
        sickPopUp.isHidden = true
    }
    
    func emitter() {
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
    
    func progressBarAnimate() {
        UIView.animate(
            withDuration: 1,
            delay: 0,
            usingSpringWithDamping: 0.8,
            initialSpringVelocity: 5,
            options: [],
            animations: {
                self.progressBar.transform = CGAffineTransform(translationX: 0, y: 50)
                self.progressBarBackground.transform = CGAffineTransform(translationX: 0, y: 50)
                self.progressBarIcon.transform = CGAffineTransform(translationX: 0, y: 50)
                self.progressBarBackgroundContainer.transform = CGAffineTransform(translationX: 0, y: 50)
        }) { (finished) in
            UIView.animate(
                withDuration: 1,
                delay: 0,
                usingSpringWithDamping: 0.8,
                initialSpringVelocity: 5,
                options: [],
                animations: {
                    self.progressBar.transform = .identity
                    self.progressBarBackground.transform = .identity
                    self.progressBarIcon.transform = .identity
                    self.progressBarBackgroundContainer.transform = .identity
            },
                completion: nil)
            
        }
    }
    
    func spawnCoin() {
        let coin1 = UIImageView(image: UIImage(named: "Coin"))
        let coin2 = UIImageView(image: UIImage(named: "Coin"))
        let coin3 = UIImageView(image: UIImage(named: "Coin"))
        let coin4 = UIImageView(image: UIImage(named: "Coin"))
        let coin5 = UIImageView(image: UIImage(named: "Coin"))
        let coin6 = UIImageView(image: UIImage(named: "Coin"))
        let coin7 = UIImageView(image: UIImage(named: "Coin"))
        let coin8 = UIImageView(image: UIImage(named: "Coin"))
        let coin9 = UIImageView(image: UIImage(named: "Coin"))
        let coin10 = UIImageView(image: UIImage(named: "Coin"))
        
        let coins: [UIImageView] = [coin1, coin2, coin3, coin4, coin5, coin6, coin7, coin8, coin9, coin10]
        for item in coins {
            let tap = UITapGestureRecognizer(target: self, action: #selector(coinTap))
            item.addGestureRecognizer(tap)
            item.isUserInteractionEnabled = true
            item.layer.position = CGPoint(x: CGFloat.random(in: 100..<view.frame.width - 200), y: CGFloat.random(in: 0..<view.frame.height - 200))
            view.addSubview(item)
        }

        animator = UIDynamicAnimator(referenceView: self.view)
        let gravity = UIGravityBehavior(items: [coin1, coin2, coin3, coin4, coin5, coin6, coin7, coin8, coin9, coin10])
        animator?.addBehavior(gravity)
        
        let collision = UICollisionBehavior(items: [coin1, coin2, coin3, coin4, coin5, coin6, coin7, coin8, coin9, coin10])
        collision.translatesReferenceBoundsIntoBoundary = true
        animator?.addBehavior(collision)
        
        let bounce = UIDynamicItemBehavior(items: [coin1, coin2, coin3, coin4, coin5, coin6, coin7, coin8, coin9, coin10])
        bounce.elasticity = 0.7
        animator?.addBehavior(bounce)
    }
    
    @objc func coinTap(sender: UITapGestureRecognizer) {
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            options: .curveEaseIn,
            animations: {
                sender.view?.layer.position = CGPoint(x: 90, y: 0)
                sender.view?.alpha = 0
        },
            completion: nil)
        rewardsValue += 1
        settingsDefaults.set(rewardsValue, forKey: Keys.rewards)
        DispatchQueue.main.async {
            self.rewardsLabel.text = "\(rewardsValue)"
        }
    }
    
    func notification() {
        let content = UNMutableNotificationContent()
        content.title = "Feeden"
        content.body = "Hooman, I'm hungry, food..miaw"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        let center = UNUserNotificationCenter.current()
        center.add(request, withCompletionHandler: nil)
    }
    
    func loadDefaults() {
        rewardsValue = settingsDefaults.integer(forKey: Keys.rewards)
        hunger = settingsDefaults.float(forKey: Keys.hunger)
        sleep = settingsDefaults.float(forKey: Keys.sleep)
        health = settingsDefaults.float(forKey: Keys.health)
        fun = settingsDefaults.float(forKey: Keys.fun)
        love = settingsDefaults.float(forKey: Keys.love)
    }
    
    //MARK: - Layouts
    func layout() {
        view.addSubview(background)
        view.addSubview(basket)
        view.addSubview(catNormal)
        view.addSubview(catSleeping)
        view.addSubview(overlaySleepingMode)
        view.addSubview(lamp)
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
        
        view.addSubview(progressBarBackgroundContainer)
        view.addSubview(progressBarBackground)
        view.addSubview(progressBar)
        view.addSubview(progressBarIcon)
        
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
            basket.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50),
            basket.widthAnchor.constraint(equalToConstant: 395),
            basket.heightAnchor.constraint(equalToConstant: 235),
            
            progressBarBackgroundContainer.centerXAnchor.constraint(equalTo: progressBar.centerXAnchor, constant: -28),
            progressBarBackgroundContainer.centerYAnchor.constraint(equalTo: progressBar.centerYAnchor),
            progressBarBackgroundContainer.widthAnchor.constraint(equalToConstant: 168 + 39 + 40),
            progressBarBackgroundContainer.heightAnchor.constraint(equalToConstant: 49),
            
            progressBarBackground.centerXAnchor.constraint(equalTo: progressBar.centerXAnchor),
            progressBarBackground.centerYAnchor.constraint(equalTo: progressBar.centerYAnchor),
            progressBarBackground.widthAnchor.constraint(equalToConstant: 168),
            progressBarBackground.heightAnchor.constraint(equalToConstant: 29),
            
            progressBar.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 20),
            progressBar.topAnchor.constraint(equalTo: view.topAnchor, constant: -30),
            progressBar.widthAnchor.constraint(equalToConstant: 158),
            progressBar.heightAnchor.constraint(equalToConstant: 19),
            
            progressBarIcon.trailingAnchor.constraint(equalTo: progressBarBackground.leadingAnchor, constant: -20),
            progressBarIcon.centerYAnchor.constraint(equalTo: progressBarBackground.centerYAnchor),
            progressBarIcon.heightAnchor.constraint(equalToConstant: 39),
            progressBarIcon.widthAnchor.constraint(equalToConstant: 39),
            
            catNormal.centerXAnchor.constraint(equalTo: basket.centerXAnchor),
            catNormal.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -30),
            
            catSleeping.centerXAnchor.constraint(equalTo: catNormal.centerXAnchor),
            catSleeping.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 20),
            
            sickPopUp.centerXAnchor.constraint(equalTo: basket.centerXAnchor, constant: 30),
            sickPopUp.bottomAnchor.constraint(equalTo: basket.topAnchor),
            
            zPopUp1.bottomAnchor.constraint(equalTo: basket.topAnchor),
            zPopUp1.trailingAnchor.constraint(equalTo: basket.trailingAnchor, constant: -100),
            zPopUp1.widthAnchor.constraint(equalToConstant: 19),
            zPopUp1.heightAnchor.constraint(equalToConstant: 29),
            
            zPopUp2.bottomAnchor.constraint(equalTo: zPopUp1.bottomAnchor, constant: -10),
            zPopUp2.trailingAnchor.constraint(equalTo: zPopUp1.leadingAnchor, constant: -10),
            zPopUp2.widthAnchor.constraint(equalTo: zPopUp1.widthAnchor, multiplier: 1.5),
            zPopUp2.heightAnchor.constraint(equalTo: zPopUp1.heightAnchor, multiplier: 1.5),
            
            zPopUp3.bottomAnchor.constraint(equalTo: zPopUp2.bottomAnchor, constant: -10),
            zPopUp3.trailingAnchor.constraint(equalTo: zPopUp2.leadingAnchor, constant: -10),
            zPopUp3.widthAnchor.constraint(equalTo: zPopUp2.widthAnchor, multiplier: 1.5),
            zPopUp3.heightAnchor.constraint(equalTo: zPopUp2.heightAnchor, multiplier: 1.5),
            
            backBtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            backBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            
            rewardsContainer.topAnchor.constraint(equalTo: backBtn.topAnchor),
            rewardsContainer.leadingAnchor.constraint(equalTo: backBtn.trailingAnchor, constant: 15),
            
            rewardsLabel.centerYAnchor.constraint(equalTo: rewardsContainer.centerYAnchor),
            rewardsLabel.trailingAnchor.constraint(equalTo: rewardsContainer.trailingAnchor, constant: -15),
            
            catHand.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 80),
            catHand.topAnchor.constraint(equalTo: view.bottomAnchor),
            
            catFood.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -25),
            catFood.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            catFood.widthAnchor.constraint(equalToConstant: 123.08),
            catFood.heightAnchor.constraint(equalToConstant: 136.6),
            
            lamp.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 30),
            lamp.leadingAnchor.constraint(equalTo: basket.leadingAnchor, constant: -180),
            lamp.widthAnchor.constraint(equalToConstant: 127),
            lamp.heightAnchor.constraint(equalToConstant: 207),
            
            
            bowl.topAnchor.constraint(equalTo: view.bottomAnchor),
            bowl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60),
            bowl.widthAnchor.constraint(equalToConstant: 163),
            bowl.heightAnchor.constraint(equalToConstant: 92),
            
            phone.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 70),
            phone.leadingAnchor.constraint(equalTo: lamp.leadingAnchor),
            phone.widthAnchor.constraint(equalToConstant: 144),
            phone.heightAnchor.constraint(equalToConstant: 124),
            
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
            
            //MARK: - Overlay Layout
            overlaySleepingMode.widthAnchor.constraint(equalTo: view.widthAnchor),
            overlaySleepingMode.heightAnchor.constraint(equalTo: view.heightAnchor),
            overlaySleepingMode.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            overlaySleepingMode.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
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
