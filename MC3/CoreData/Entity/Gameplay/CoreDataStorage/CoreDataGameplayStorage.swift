//
//  CoreDataGameplayStorage.swift
//  MC3
//
//  Created by Arif Luthfiansyah on 19/07/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import CoreData
import Foundation

final class CoreDataGameplayStorage: GameplayStorage {

    private let coreDataStorage: CoreDataStorage

    init() {
        self.coreDataStorage = CoreDataStorage.shared
    }

    func createGameplay(completion: @escaping (Result<Gameplay, Error>) -> Void) {
        self.coreDataStorage.performBackgroundTask({ context in
            do {
                let entity = GameplayEntity()
                try context.save()
                completion(.success(Gameplay(entity: entity)))
            } catch (let error) {
                completion(.failure(CoreDataStorageError.createError(error)))
            }
        })
    }

    func readGameplays(completion: @escaping (Result<[Gameplay], Error>) -> Void) {
        self.coreDataStorage.performBackgroundTask({ context in
            do {
                let request: NSFetchRequest = GameplayEntity.fetchRequest()
                let result = try context.fetch(request).map({ Gameplay(entity: $0) })
                completion(.success(result))
            } catch (let error) {
                completion(.failure(CoreDataStorageError.readError(error)))
            }
        })
    }

    func updateGameplay(byId id: String, completion: @escaping (Result<Gameplay?, Error>) -> Void) {
        self.coreDataStorage.performBackgroundTask({ context in
            do {
                let request: NSFetchRequest = GameplayEntity.fetchRequest()
                request.predicate = NSPredicate(format: "id == %@", id)
                let result = try context.fetch(request).first
            } catch {

            }
        })
    }

}
