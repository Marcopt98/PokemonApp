import SwiftUI

struct PokemonImage: View {
    @ObservedObject private var viewModel: PokemonImageViewModel
    
    private var width: CGFloat
    private var height: CGFloat
    
    init(imageLink: String, width: CGFloat, height: CGFloat) {
        viewModel = PokemonImageViewModel(imageLink: imageLink)
        self.width = width
        self.height = height
    }
    
    var body: some View {
        Image(uiImage: (viewModel.imageData.count == 0) ? UIImage(named: "default_card")!
            : UIImage(data: viewModel.imageData)!)
            .resizable()
            .scaledToFit()
            .frame(width: width, height: height)
            .clipped()
            .cornerRadius(10)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(color: .gray, radius: 10, x: 3, y: 3)
    }
}
