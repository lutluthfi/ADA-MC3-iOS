//
//  Animal.swift
//  MC3
//
//  Created by Arif Luthfiansyah on 21/07/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import Foundation

struct Animal {

    let category: AnimalCategory
    let id: String
    let name: String

}

enum AnimalCategory: String {
    case bird = "bird"
    case cat = "cat"
    case dog = "dog"
}

// MARK: - Static Object
extension Animal {

    static let kBrownCat = Animal(
        category: .cat,
        id: "1",
        name: "Brown Cat"
    )

}
