//
//  GameplayStorage.swift
//  MC3
//
//  Created by Arif Luthfiansyah on 19/07/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import Foundation

protocol GameplayStorage {

    func createGameplay(completion: @escaping (Result<Gameplay, Error>) -> Void)
    func readGameplays(completion: @escaping (Result<[Gameplay], Error>) -> Void)
    func updateGameplay(byId id: String, completion: @escaping (Result<Gameplay?, Error>) -> Void)

}
