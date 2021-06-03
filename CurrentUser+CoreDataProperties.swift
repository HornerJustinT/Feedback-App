//
//  CurrentUser+CoreDataProperties.swift
//  blueprint
//
//  Created by Justin Horner on 5/5/21.
//
//

import Foundation
import CoreData


extension CurrentUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CurrentUser> {
        return NSFetchRequest<CurrentUser>(entityName: "CurrentUser")
    }

    @NSManaged public var currentUser: String?

}

extension CurrentUser : Identifiable {

}
