//
//  Country+CoreDataProperties.swift
//  CandyCane
//
//  Created by RichK on 5/19/20.
//  Copyright © 2020 Rich Kummer. All rights reserved.
//
//

import Foundation
import CoreData


extension Country {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Country> {
        return NSFetchRequest<Country>(entityName: "Country")
    }

    @NSManaged public var fullName: String?
    @NSManaged public var shortName: String?
    @NSManaged public var candy: NSSet?
    
    public var wrappedShortName: String {
        shortName ?? "Unknown Country"
    }
    
    public var wrappedFullName: String {
        fullName ?? "Unknown Country"
    }
    
    public var candyArray: [Candy] {
        let set = candy as? Set<Candy> ?? []
        return set.sorted {
            $0.wrappedName < $1.wrappedName
        }
    }

}

// MARK: Generated accessors for candy
extension Country {

    @objc(addCandyObject:)
    @NSManaged public func addToCandy(_ value: Candy)

    @objc(removeCandyObject:)
    @NSManaged public func removeFromCandy(_ value: Candy)

    @objc(addCandy:)
    @NSManaged public func addToCandy(_ values: NSSet)

    @objc(removeCandy:)
    @NSManaged public func removeFromCandy(_ values: NSSet)

}
