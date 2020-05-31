//
//  Pokemon+CoreDataProperties.swift
//  labtest1pokemon
//
//  Created by Dhwani  on 2020-05-25.
//  Copyright © 2020 Dimple. All rights reserved.
//
//

import Foundation
import CoreData


extension Pokemon {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Pokemon> {
        return NSFetchRequest<Pokemon>(entityName: "Pokemon")
    }

    @NSManaged public var pokemonimage: String?
    @NSManaged public var pokemonName: String?
    @NSManaged public var pokemonPoints: Int16
    @NSManaged public var pokemonType: String?

}
