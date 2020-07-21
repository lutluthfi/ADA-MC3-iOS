//
//  GameplayEntity+CoreDataProperties.swift
//  MC3
//
//  Created by Arif Luthfiansyah on 19/07/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//
//

import Foundation
import CoreData


extension GameplayEntity {

    @NSManaged public var createdAt: Date
    @NSManaged public var currentDate: Date
    @NSManaged public var id: String
    @NSManaged public var updatedAt: Date

}

extension GameplayEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GameplayEntity> {
        return NSFetchRequest<GameplayEntity>(entityName: "GameplayEntity")
    }

}

extension GameplayEntity {

    convenience init(insertInto context: NSManagedObjectContext) {
        self.init(context: context)
        self.createdAt = Date()
        self.currentDate = Date()
        self.id = UUID().uuidString
        self.updatedAt = Date()
    }

}
