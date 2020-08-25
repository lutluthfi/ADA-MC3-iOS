//
//  DataModel.swift
//  MC3
//
//  Created by Muhammad Faruuq Qayyum on 25/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import Foundation

class DataModel {
    
    static var bushItems = [
        ItemShop(image: "Bush-1", price: 20, isPurchased: false, isLocked: false, itemNumber: 0),
        ItemShop(image: "Bush-2", price: 30, isPurchased: false, isLocked: false, itemNumber: 1),
        ItemShop(image: "Bush-2-Disable", price: 0, isPurchased: true, isLocked: true, itemNumber: 2),
        ItemShop(image: "Bush-2-Disable", price: 0, isPurchased: true, isLocked: true, itemNumber: 3),
        ItemShop(image: "Bush-2-Disable", price: 0, isPurchased: true, isLocked: true, itemNumber: 4),
        ItemShop(image: "Bush-2-Disable", price: 0, isPurchased: true, isLocked: true, itemNumber: 5),
        ItemShop(image: "Bush-2-Disable", price: 0, isPurchased: true, isLocked: true, itemNumber: 6),
        ItemShop(image: "Bush-2-Disable", price: 0, isPurchased: true, isLocked: true, itemNumber: 7),
    ]
    static var benchItems = [
        ItemShop(image: "Bench", price: 40, isPurchased: false, isLocked: false, itemNumber: 0),
        ItemShop(image: "Bench-Disable", price: 40, isPurchased: false, isLocked: false, itemNumber: 1),
        ItemShop(image: "Bench-Disable", price: 0, isPurchased: true, isLocked: true, itemNumber: 2),
        ItemShop(image: "Bench-Disable", price: 0, isPurchased: true, isLocked: true, itemNumber: 3),
        ItemShop(image: "Bench-Disable", price: 0, isPurchased: true, isLocked: true, itemNumber: 4),
        ItemShop(image: "Bench-Disable", price: 0, isPurchased: true, isLocked: true, itemNumber: 5),
        ItemShop(image: "Bench-Disable", price: 0, isPurchased: true, isLocked: true, itemNumber: 6),
        ItemShop(image: "Bench-Disable", price: 0, isPurchased: true, isLocked: true, itemNumber: 7)
    ]
    static var flowerItems = [
        ItemShop(image: "Bush-2-Disable", price: 0, isPurchased: true, isLocked: true, itemNumber: 0),
        ItemShop(image: "Bush-2-Disable", price: 0, isPurchased: true, isLocked: true, itemNumber: 1),
        ItemShop(image: "Bush-2-Disable", price: 0, isPurchased: true, isLocked: true, itemNumber: 2),
        ItemShop(image: "Bush-2-Disable", price: 0, isPurchased: true, isLocked: true, itemNumber: 3),
        ItemShop(image: "Bush-2-Disable", price: 0, isPurchased: true, isLocked: true, itemNumber: 4),
        ItemShop(image: "Bush-2-Disable", price: 0, isPurchased: true, isLocked: true, itemNumber: 5),
        ItemShop(image: "Bush-2-Disable", price: 0, isPurchased: true, isLocked: true, itemNumber: 6),
        ItemShop(image: "Bush-2-Disable", price: 0, isPurchased: true, isLocked: true, itemNumber: 7),
    ]
    static var lampItems = [
        ItemShop(image: "Reward-Lamp-1", price: 50, isPurchased: false, isLocked: false, itemNumber: 0),
        ItemShop(image: "Reward-Lamp-2", price: 60, isPurchased: false, isLocked: false, itemNumber: 1),
        ItemShop(image: "Reward-Lamp-Disable", price: 0, isPurchased: true, isLocked: true, itemNumber: 2),
        ItemShop(image: "Reward-Lamp-Disable", price: 0, isPurchased: true, isLocked: true, itemNumber: 3),
        ItemShop(image: "Reward-Lamp-Disable", price: 0, isPurchased: true, isLocked: true, itemNumber: 4),
        ItemShop(image: "Reward-Lamp-Disable", price: 0, isPurchased: true, isLocked: true, itemNumber: 5),
        ItemShop(image: "Reward-Lamp-Disable", price: 0, isPurchased: true, isLocked: true, itemNumber: 6),
        ItemShop(image: "Reward-Lamp-Disable", price: 0, isPurchased: true, isLocked: true, itemNumber: 7),
    ]
    static var treeItems = [
        ItemShop(image: "Tree", price: 70, isPurchased: false, isLocked: true, itemNumber: 0),
        ItemShop(image: "Bush-2-Disable", price: 0, isPurchased: true, isLocked: true, itemNumber: 1),
        ItemShop(image: "Bush-2-Disable", price: 0, isPurchased: true, isLocked: true, itemNumber: 2),
        ItemShop(image: "Bush-2-Disable", price: 0, isPurchased: true, isLocked: true, itemNumber: 3),
        ItemShop(image: "Bush-2-Disable", price: 0, isPurchased: true, isLocked: true, itemNumber: 4),
        ItemShop(image: "Bush-2-Disable", price: 0, isPurchased: true, isLocked: true, itemNumber: 5),
        ItemShop(image: "Bush-2-Disable", price: 0, isPurchased: true, isLocked: true, itemNumber: 6),
        ItemShop(image: "Bush-2-Disable", price: 0, isPurchased: true, isLocked: true, itemNumber: 7),
    ]
    
    static let bushFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("bush.plist")
    static let benchFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("bench.plist")
    static let flowerFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("flower.plist")
    static let lampFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("lamp.plist")
    static let treeFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("tree.plist")
    
}
