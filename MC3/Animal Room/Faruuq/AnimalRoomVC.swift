//
//  AnimalRoomVC.swift
//  MC3
//
//  Created by Muhammad Faruuq Qayyum on 16/07/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class AnimalRoomVC: UIViewController {
    
    var rewards: Int = 35000
    let foodIcons: [UIImage] = [#imageLiteral(resourceName: "Bowl-Empty"), #imageLiteral(resourceName: "Bowl-Half"), #imageLiteral(resourceName: "Bowl-Full"), #imageLiteral(resourceName: "Bowl-Excess")]
    
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
    
    //MARK: - Cat Item
    let cat: UIImageView = {
        let img = UIImageView()
        img.image = #imageLiteral(resourceName: "Cat-Normal-1")
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
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
        label.text = "35000"
        label.textColor = .black
        label.textAlignment = .right
        label.font = UIFont(name: "ChalkboardSE-Bold", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - Cat Hand
    let catHand: UIImageView = {
        let img = UIImageView()
        img.image = #imageLiteral(resourceName: "Cat-Hand")
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    //MARK: - Bowl Item
    let bowl: UIImageView = {
        let img = UIImageView()
        img.image = #imageLiteral(resourceName: "Bowl-Half")
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    //MARK: - Back Button
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
    
    //MARK: - Food Button
    let foodBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "Food-Icon"), for: .normal)
        btn.sizeThatFits(CGSize(width: 39, height: 39))
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(foodBtnAction), for: .touchUpInside)
        return btn
    }()
    
    @objc func foodBtnAction(sender: UIButton) {
        print("food button tapped")
        UIView.animate(
            withDuration: 1,
            delay: 0,
            options: .curveEaseInOut,
            animations: {
                print("foodicon position : \(self.bowl.layer.frame)")
                self.bowl.layer.frame = CGRect(x: 64, y: 280, width: self.bowl.frame.width, height: self.bowl.frame.height)
        }) { (foodIconCompletedAction) in
            print("food completion handler")
        }
        UIView.animate(
            withDuration: 1,
            delay: 0,
            options: [.curveEaseInOut, .autoreverse],
            animations: {
                print("cathand position : \(self.catHand.layer.frame)")
                self.catHand.layer.frame = CGRect(x: 84, y: 300, width: self.catHand.frame.width, height: self.catHand.frame.height)
        }) { (catHandCompletedAction) in
            print("cat completion handler")
            self.catHand.layer.frame = CGRect(x: 84, y: 486, width: self.catHand.frame.width, height: self.catHand.frame.height)
        }
    }
    
    //MARK: - Zzz Button
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
    }
    
    //MARK: - Medical Button
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
    }
    
    //MARK: - Game Button
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
    
    //MARK: - Care button
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
    }
    
    func layout() {
        view.addSubview(background)
        view.addSubview(basket)
        view.addSubview(cat)
        view.addSubview(backBtn)
        view.addSubview(rewardsContainer)
        view.addSubview(rewardsLabel)
        view.addSubview(bowl)
        view.addSubview(catHand)
        view.addSubview(foodBtn)
        view.addSubview(zzzBtn)
        view.addSubview(medicalBtn)
        view.addSubview(gameBtn)
        view.addSubview(careBtn)
        
        NSLayoutConstraint.activate([
            //MARK: - Item layout
            background.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            background.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            basket.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            basket.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: +50),
            basket.widthAnchor.constraint(equalToConstant: 395),
            basket.heightAnchor.constraint(equalToConstant: 235),
            
            cat.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cat.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -30),
            cat.widthAnchor.constraint(equalToConstant: 176),
            cat.heightAnchor.constraint(equalToConstant: 223),
            
            backBtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            backBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            
            rewardsContainer.topAnchor.constraint(equalTo: backBtn.topAnchor),
            rewardsContainer.leadingAnchor.constraint(equalTo: backBtn.trailingAnchor, constant: 15),
            
            rewardsLabel.centerYAnchor.constraint(equalTo: rewardsContainer.centerYAnchor),
            rewardsLabel.trailingAnchor.constraint(equalTo: rewardsContainer.trailingAnchor, constant: -15),
            
            catHand.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            catHand.topAnchor.constraint(equalTo: bowl.bottomAnchor, constant: -20),
            
            bowl.topAnchor.constraint(equalTo: view.bottomAnchor),
            bowl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            bowl.widthAnchor.constraint(equalToConstant: 163),
            bowl.heightAnchor.constraint(equalToConstant: 92),
            
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
            careBtn.trailingAnchor.constraint(equalTo: foodBtn.trailingAnchor)
        ])
    }

}
