//
//  GameplayDomainEntity.swift
//  MC3
//
//  Created by Arif Luthfiansyah on 19/07/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import Foundation

struct Gameplay {

    let createdAt: Date
    let currentDate: Date
    let id: String
    let updatedAt: Date

}

// MARK: - Init Function
extension Gameplay {

    init(entity: GameplayEntity) {
        self.createdAt = entity.createdAt
        self.currentDate = entity.currentDate
        self.id = entity.id
        self.updatedAt = entity.updatedAt
    }

}
