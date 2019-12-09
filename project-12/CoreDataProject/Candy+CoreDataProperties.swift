//
//  Candy+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Erik Waterham on 09/12/2019.
//  Copyright © 2019 Erik Waterham. All rights reserved.
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
