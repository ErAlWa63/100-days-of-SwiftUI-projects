//
//  Movie+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Erik Waterham on 06/12/2019.
//  Copyright © 2019 Erik Waterham. All rights reserved.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var title: String?
    @NSManaged public var director: String?
    @NSManaged public var year: Int16

    public var wrappedTitle: String {
        title ?? "Unknown Title"
    }

}
