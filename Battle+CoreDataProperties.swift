//
//  Battle+CoreDataProperties.swift
//  labtest1pokemon
//
//  Created by Dhwani  on 2020-05-26.
//  Copyright © 2020 Dimple. All rights reserved.
//
//

import Foundation
import CoreData


extension Battle {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Battle> {
        return NSFetchRequest<Battle>(entityName: "Battle")
    }

    @NSManaged public var date: NSDate?
    @NSManaged public var winner: Pokemon?

}
