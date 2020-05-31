//
//  Pokemons+CoreDataProperties.swift
//  labtest1pokemon
//
//  Created by Dhwani  on 2020-05-25.
//  Copyright © 2020 Dimple. All rights reserved.
//
//

import Foundation
import CoreData


extension Pokemons {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Pokemons> {
        return NSFetchRequest<Pokemons>(entityName: "Pokemons")
    }

    @NSManaged public var pokemonimage: String?
    @NSManaged public var pokemonName: String?
    @NSManaged public var pokemonPoints: Int16
    @NSManaged public var pokemonType: String?

}
