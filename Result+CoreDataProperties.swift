//
//  Result+CoreDataProperties.swift
//  Dices
//
//  Created by Vladimir on 26.07.2021.
//
//

import Foundation
import CoreData


extension Result {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Result> {
        return NSFetchRequest<Result>(entityName: "Result")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var date: Date?
    @NSManaged public var dice: NSSet?
    
    public var dicesArray: [Dice] {
        let set = dice as? Set<Dice> ?? []
        return set.sorted {_,_ in
            return true

        }
    }

}

// MARK: Generated accessors for dice
extension Result {

    @objc(addDiceObject:)
    @NSManaged public func addToDice(_ value: Dice)

    @objc(removeDiceObject:)
    @NSManaged public func removeFromDice(_ value: Dice)

    @objc(addDice:)
    @NSManaged public func addToDice(_ values: NSSet)

    @objc(removeDice:)
    @NSManaged public func removeFromDice(_ values: NSSet)

}

extension Result : Identifiable {

}
