//
//  Candy+CoreDataProperties.swift
//  CandyCane
//
//  Created by RichK on 5/19/20.
//  Copyright © 2020 Rich Kummer. All rights reserved.
//
//

import Foundation
import CoreData


extension Candy {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Candy> {
        return NSFetchRequest<Candy>(entityName: "Candy")
    }

    @NSManaged public var name: String?
    @NSManaged public var origin: Country?

    public var wrappedName: String {
        name ?? "Unknown Candy"
    }
}
