import SwiftUI
import Combine

final class PokemonDetailsViewModel: ObservableObject {

    @Published var id = ""

    @Published private(set) var pokemon = PokemonDetails()
    

    private var searchCancellable: Cancellable? {
        didSet { oldValue?.cancel() }
    }
    
    deinit {
        searchCancellable?.cancel()
    }
    
    init(id: String) {
        self.id = id
    }

    func getPokemonInfo() {
        let urlId = "https://api.pokemontcg.io/v1/cards/\(id)"

        guard let url = URL(string: urlId) else { return }

        searchCancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: PokemonDetailsResponse.self, decoder: JSONDecoder())
            .map { $0.card }
            .replaceError(with: PokemonDetails())
            .receive(on: RunLoop.main)
            .assign(to: \.pokemon, on: self)
    }
}
