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
    
    func z2Animation() {
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
    
    func z3Animation() {
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
    
    func zAnimationOff() {
        UIView.animate(
            withDuration: 1,
            delay: 1,
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
    
    func lampAnimation() {
        UIView.animate(
            withDuration: 1,
            delay: 0,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 5,
            options: [],
            animations: {
                self.lamp.alpha = 1
                self.lamp.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        },
            completion: nil)
    }
    
    func phoneAnimation() {
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
            },
                completion: nil)
            
        }
    }
    
    //MARK: - Layouts
    func layout() {
        view.addSubview(background)
        view.addSubview(basket)
        view.addSubview(progressBarBackground)
        view.addSubview(progressBar)
        view.addSubview(progressBarIcon)
        view.addSubview(catNormal)
        view.addSubview(catSleeping)
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
            catFood.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            catFood.widthAnchor.constraint(equalToConstant: 123.08),
            catFood.heightAnchor.constraint(equalToConstant: 136.6),
            
            lamp.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 30),
            lamp.leadingAnchor.constraint(equalTo: basket.leadingAnchor, constant: -180),
            lamp.widthAnchor.constraint(equalToConstant: 100),
            lamp.heightAnchor.constraint(equalToConstant: 180),
            
            
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
            
            //MARK: - Overlay Layout
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
