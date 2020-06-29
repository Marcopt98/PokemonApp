import Foundation
import Combine

class PokemonImageViewModel: ObservableObject {
    
    @Published var imageData = Data()
    
    private var imageDownloadTask: AnyCancellable?
    
    init(imageLink: String) {
        self.getImageData(from: imageLink)
    }
    
    private func getImageData(from urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        imageDownloadTask = URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .replaceError(with: Data())
            .eraseToAnyPublisher()
            .receive(on: RunLoop.main)
            .assign(to: \PokemonImageViewModel.imageData, on: self)
    }
}
