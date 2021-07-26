//
//  Dice+CoreDataProperties.swift
//  Dices
//
//  Created by Vladimir on 26.07.2021.
//
//

import Foundation
import CoreData


extension Dice {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Dice> {
        return NSFetchRequest<Dice>(entityName: "Dice")
    }

    @NSManaged public var number: Int16

}

extension Dice : Identifiable {

}
