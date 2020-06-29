import Foundation
import CoreData

public class PokemonData: NSManagedObject, Identifiable {
    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var imageUrl: String?
    @NSManaged public var subtype: String?
    @NSManaged public var rarity: String?
}

