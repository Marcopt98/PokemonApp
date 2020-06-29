import SwiftUI

struct WidgetView: View {
    @ObservedObject var viewModel = PokemonListViewModel()
    
    var body: some View {
        VStack {
            HStack{
                PokemonImage(imageLink: "https://images.pokemontcg.io/ex16/1_hires.png", width: 70, height: 120)
                Text("Pokemon Test Name")
                    .font(Font.system(size: 25).bold())
            }
            
//            PokemonRow(pokemon: viewModel.pokemons[Int.random(in: 0 ... (viewModel.pokemons.count - 1))])

            
        }.onAppear{
//            self.viewModel.search()
        }
    }
}
