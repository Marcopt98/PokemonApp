import Foundation
import CoreData

extension PokemonListViewModel{
    
    func savePokemons() {
        
        guard let context = objectContext else { return }
        
        deleteAllData(context: context)
        
        for pokemon in pokemons {
            let manage = PokemonData(context: context)
            manage.name = pokemon.name
            manage.id = pokemon.id
            manage.imageUrl = pokemon.imageUrl
            manage.subtype = pokemon.subtype
            manage.rarity = pokemon.rarity
        }
        
        // context wasn't finding the saveContext() method for no reason...
        // context.saveContext()
        
        // taken from AppDelegate.swift
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func deleteAllData(context: NSManagedObjectContext){
        let deleteAllRequest = NSBatchDeleteRequest(fetchRequest: NSFetchRequest<NSFetchRequestResult>(entityName: "PokemonData"))
        
        do {
            try context.execute(deleteAllRequest)
            try context.save()
        } catch {
            print(error)
        }
    }
    
    func loadPokemons() {
        guard let context = objectContext else { return }
        
        let fetchRequest = NSFetchRequest<PokemonData>(entityName: "PokemonData")
        
        if let result = try? context.fetch(fetchRequest) {
//            self.resetSearch()
            pokemons.removeAll()
            pageStatus = PageStatus.ready(nextPage: 1)
            
            for fetchedPokemon in result {
                let pokemon = Pokemon(id: fetchedPokemon.id ?? "", name: fetchedPokemon.name ?? "", imageUrl: fetchedPokemon.imageUrl ?? "",subtype: fetchedPokemon.subtype ?? "", rarity: fetchedPokemon.rarity ?? "")
                
                pokemons.append(pokemon)
            }
        }
    }
}
