import SwiftUI

struct PokemonRow: View {
    @State var pokemon: Pokemon
    
    var body: some View {
        HStack {
            NavigationLink(destination: PokemonDetailsView(viewModel: .init(id: pokemon.id))) {
                PokemonImage(imageLink: pokemon.imageUrl, width: 70, height: 120)
                
                VStack(alignment: .leading, spacing: 5) {
                    
                Text(pokemon.name)
                    .font(Font.system(size: 24).bold())
                    .lineLimit(1)
                    .minimumScaleFactor(0.1)
                    .padding(.top, 10)
                    
                Text("Stage: \(pokemon.subtype)")
                    .font(Font.system(size: 16).bold())
                    .foregroundColor(Color.gray)
                    .lineLimit(1)
                    .minimumScaleFactor(0.1)
                
                    Text("Rarity: \(pokemon.rarity)")
                        .font(Font.system(size: 14))
                        .foregroundColor(Color.gray)
                        .minimumScaleFactor(0.1)
                 Spacer()
                }
                
            }
        }
        .frame(height: 120)
    }
}

