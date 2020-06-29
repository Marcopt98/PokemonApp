import SwiftUI
import Combine
import CoreData

final class PokemonListViewModel: ObservableObject {
    
    @Published var name = ""
    
    @Published var pokemons = [Pokemon]()
    
    @Published var endOfList = false
    
    var pageStatus = PageStatus.ready(nextPage: 1)
    
    var urlBase = "https://api.pokemontcg.io/v1/cards?page={page}"
    var urlBaseWithName = "https://api.pokemontcg.io/v1/cards?page={page}&name="
    
    var objectContext: NSManagedObjectContext?
    
    var cancellable : Set<AnyCancellable> = Set()

    
    func shouldLoadMore(pokemon: Pokemon) -> Bool{
        if let lastId = pokemons.last?.id{
            if pokemon.id == lastId{
                return true
            }
            else{
                return false
            }
        }
        
        return false
    }
    
    
    func search() {
        guard case let .ready(page) = pageStatus else {
            return
        }
        
        pageStatus = .loading(page: page)
        
        
        let url : URL!
        
        
        if name.isEmpty {
            url = URL(string: urlBase.replacingOccurrences(of: "{page}", with: String(page)))!
        }else{
            var pokemonName = name
            if pokemonName.contains(" ") {
                pokemonName = pokemonName.replacingOccurrences(of: " ", with: "%20")
            }
            
            url = URL(string: "\(urlBaseWithName.replacingOccurrences(of: "{page}", with: String(page)))\(pokemonName)")!
        }

        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: PokemonResponse.self, decoder: JSONDecoder())
            .map { $0.cards }
            .eraseToAnyPublisher()
            .replaceError(with: [])
            .receive(on: RunLoop.main)
//            .assign(to: \.pokemons, on: self)
            .sink(receiveCompletion: { completion in
                
                switch completion {
                case .finished:
                    print("completed")
                    break
                case .failure( _):
                    self.endOfList = true
                    self.pageStatus = .done
                }
            }) { newPokemonList in
                
                if newPokemonList.count == 0{
                    self.pageStatus = .done
                }
                else{
                    self.pageStatus = .ready(nextPage: page + 1)
                    self.pokemons.append(contentsOf: newPokemonList)
                }
        }
        .store(in: &cancellable)
    }
    
    func resetSearch(){
        self.pokemons.removeAll()
        pageStatus = PageStatus.ready(nextPage: 1)
    }
}


extension PokemonListViewModel {
    enum PageStatus {
        case ready (nextPage: Int)
        case loading (page: Int)
        case done
    }
}
