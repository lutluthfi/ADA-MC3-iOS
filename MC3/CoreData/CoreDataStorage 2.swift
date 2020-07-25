//
//  CoreDataStorage.swift
//  MC3
//
//  Created by Arif Luthfiansyah on 19/07/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import CoreData
import Foundation

enum CoreDataStorageError: Error {
    case createError(Error)
    case deleteError(Error)
    case readError(Error)
    case updateError(Error)
}

final class CoreDataStorage {

    static let shared = CoreDataStorage()

    // MARK: - Core Data stack
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoreDataStorage")
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                debugPrint("CoreDataStorage Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()

    // MARK: - Core Data Saving support
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                debugPrint("CoreDataStorage Unresolved error \(error), \((error as NSError).userInfo)")
            }
        }
    }

    func performBackgroundTask(_ block: @escaping (NSManagedObjectContext) -> Void) {
        persistentContainer.performBackgroundTask(block)
    }

}
