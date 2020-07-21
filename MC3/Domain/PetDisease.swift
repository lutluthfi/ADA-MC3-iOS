//
//  PetDisease.swift
//  MC3
//
//  Created by Arif Luthfiansyah on 21/07/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import Foundation

struct PetDisease {

    let description: String
    let id: String
    let title: String

}

extension PetDisease {

    static let kDiarePetDisease = PetDisease(
        description: "Diare is lorem ipsum",
        id: "DiarePetDisease",
        title: "Diare"
    )

}
