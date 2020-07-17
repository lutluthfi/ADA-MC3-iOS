//
//  AnimalRoom.swift
//  MC3
//
//  Created by Muhammad Faruuq Qayyum on 14/07/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import SpriteKit
import GameplayKit

class AnimalRoom: SKScene {
    
    //MARK: - Items
    let background: SKSpriteNode = {
        let bg = SKSpriteNode(imageNamed: "Background-Animal-Room")
        bg.zPosition = 0
        return bg
    }()
    
    let basket: SKSpriteNode = {
        let basket = SKSpriteNode(imageNamed: "Basket")
        basket.zPosition = 1
        basket.setScale(0.8)
        return basket
    }()
    
    let cat: SKSpriteNode = {
        let cat = SKSpriteNode(imageNamed: "Cat-Normal-1")
        cat.zPosition = 2
        cat.setScale(0.8)
        return cat
    }()
    
    //MARK: - Rewards Container
    let rewardsContainerEdge: SKSpriteNode = {
        let box = SKSpriteNode()
        box.color = UIColor(named: "413834")!
        box.zPosition = 1
        return box
    }()
    
    let rewardsContainer: SKSpriteNode = {
        let box = SKSpriteNode()
        box.color = UIColor.white
        box.zPosition = 2
        return box
    }()
    
    let rewardsIcon: SKSpriteNode = {
        let btn = UIImage(systemName: "dollarsign.circle.fill")?.withTintColor(.systemRed)
        let data = btn?.pngData()
        let newImg = UIImage(data: data!)
        let texture = SKTexture(image: newImg!)
        let newBtn = SKSpriteNode(texture: texture, size: CGSize(width: 20, height: 20))
        newBtn.zPosition = 3
        return newBtn
    }()
    
    //MARK: - Back Button Container
    let boxContainerEdge1: SKSpriteNode = {
        let box = SKSpriteNode()
        box.color = UIColor(named: "413834")!
        box.zPosition = 1
        return box
    }()
    
    let boxContainer1: SKSpriteNode = {
        let box = SKSpriteNode()
        box.color = UIColor.white
        box.zPosition = 2
        return box
    }()
    
    let backButton: SKSpriteNode = {
        let btn = UIImage(systemName: "chevron.left")?.withTintColor(.systemRed)
        let data = btn?.pngData()
        let newImg = UIImage(data: data!)
        let texture = SKTexture(image: newImg!)
        let newBtn = SKSpriteNode(texture: texture, size: CGSize(width: 20, height: 20))
        newBtn.zPosition = 3
        return newBtn
    }()
    
    //MARK: - DidMove
    
    override func didMove(to view: SKView) {
        self.size.height = 414
        self.size.width = 896
        self.backgroundColor = UIColor(named: "B568C2") ?? UIColor.systemBlue
        layout()
    }
    
    //MARK: - Functions
    
    func layout() {
        background.size = CGSize(width: self.frame.width, height: self.frame.height)
        addChild(background)
        
        basket.position = CGPoint(x: self.frame.midX, y: self.frame.midY - 50)
        addChild(basket)
        
        cat.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 20)
        addChild(cat)
        
        rewardsContainerEdge.position = CGPoint(x: self.frame.minX + 190, y: self.frame.maxY - 40)
        rewardsContainerEdge.size = CGSize(width: 107, height: 39)
        addChild(rewardsContainerEdge)
        
        rewardsContainer.position = rewardsContainerEdge.position
        rewardsContainer.size = CGSize(width: 100, height: 32)
        addChild(rewardsContainer)
        
        boxContainerEdge1.position = CGPoint(x: self.frame.minX + 100, y: self.frame.maxY - 40)
        boxContainerEdge1.size = CGSize(width: 39, height: 39)
        addChild(boxContainerEdge1)
        
        boxContainer1.position = boxContainerEdge1.position
        boxContainer1.size = CGSize(width: 32, height: 32)
        addChild(boxContainer1)
        
        backButton.position = boxContainer1.position
        addChild(backButton)
        
        rewardsIcon.position = rewardsContainer.position
        addChild(rewardsIcon)

    }
    
}

