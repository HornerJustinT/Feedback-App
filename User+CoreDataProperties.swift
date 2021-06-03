//
//  User+CoreDataProperties.swift
//  blueprint
//
//  Created by Justin Horner on 5/4/21.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var foodRating: Int64
    @NSManaged public var gymRating: Int64
    @NSManaged public var password: String?
    @NSManaged public var roomRating: Int64
    @NSManaged public var userName: String?
    @NSManaged public var foodQ1: Int64
    @NSManaged public var foodQ2: Int64
    @NSManaged public var foodQ3: Int64
    @NSManaged public var foodQ4: Int64
    @NSManaged public var foodQ5: Int64
    @NSManaged public var gymQ1: Int64
    @NSManaged public var gymQ2: Int64
    @NSManaged public var gymQ3: Int64
    @NSManaged public var gymQ4: Int64
    @NSManaged public var gymQ5: Int64
    @NSManaged public var roomQ1: Int64
    @NSManaged public var roomQ2: Int64
    @NSManaged public var roomQ3: Int64
    @NSManaged public var roomQ4: Int64
    @NSManaged public var roomQ5: Int64
    @NSManaged public var generalRating: Int64
    @NSManaged public var genQ1: Int64
    @NSManaged public var genQ2: Int64
    @NSManaged public var genQ3: Int64
    @NSManaged public var genQ4: Int64
    @NSManaged public var genQ5: Int64
    @NSManaged public var beachRating: Int64
    @NSManaged public var beachQ1: Int64
    @NSManaged public var beachQ2: Int64
    @NSManaged public var beachQ3: Int64
    @NSManaged public var beachQ4: Int64
    @NSManaged public var beachQ5: Int64

}

extension User : Identifiable {

}
