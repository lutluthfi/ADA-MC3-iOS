//
//  PetActivity.swift
//  MC3
//
//  Created by Arif Luthfiansyah on 21/07/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import Foundation

struct PetActivity {

    let category: PetActivityCategory
    /// The value is in second
    let cooldown: Int
    /// The value is in second
    let duration: Int
    let id: String
    let title: String

}

enum PetActivityCategory: String {
    case bathing
    case eating
    case playing
}

extension PetActivity {

    static let kEatSmallPetActivity = PetActivity(
        category: .eating,
        cooldown: 60 * 60 * 12,
        duration: 60 * 30,
        id: UUID().uuidString,
        title: "Eat Small Portion"
    )
    static let kPlayCatchMicePetActivity = PetActivity(
        category: .eating,
        cooldown: 60 * 45,
        duration: 60 * 1,
        id: UUID().uuidString,
        title: "Play Catch the Mice"
    )

}
