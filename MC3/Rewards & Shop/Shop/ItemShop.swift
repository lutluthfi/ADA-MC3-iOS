//
//  ItemShop.swift
//  MC3
//
//  Created by Muhammad Faruuq Qayyum on 17/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

struct ItemShop: Codable {
    var image: String
    var price: Int
    var isPurchased: Bool
    var isLocked: Bool
    var itemNumber: Int
    
    init(image: String, price: Int, isPurchased: Bool, isLocked: Bool, itemNumber: Int) {
        self.image = image
        self.price = price
        self.isPurchased = isPurchased
        self.isLocked = isLocked
        self.itemNumber = itemNumber
    }
}
