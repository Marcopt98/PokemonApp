import SwiftUI

struct PokemonDetailsView: View {
    @ObservedObject var viewModel: PokemonDetailsViewModel
        
    var body: some View {
        ScrollView(.vertical){
            VStack() {
                
                PokemonImage(imageLink: viewModel.pokemon.imageUrlHiRes, width: 180, height: 260)
                
                Text(viewModel.pokemon.name)
                    .font(.system(size: 28, weight: .bold))
                    .padding([.leading, .trailing], 20)
                
                
                Text("\(viewModel.pokemon.hp ?? "None") HP")
                    .padding([.leading, .trailing], 20)
                    .foregroundColor(.gray)
                
                Spacer()
                    .frame(height: 20)
                
                Divider()
                    .padding([.leading, .trailing], 20)
                
                Group{
                    
                    Text("Attacks")
                        .font(.system(size: 20, weight: .bold))
                    
                    HStack(spacing: 10) {
                        ForEach(0 ..< (viewModel.pokemon.attacks?.count ?? 0), id: \.self) { index in
                            InfoDetailLabel(text: self.viewModel.pokemon.attacks?[index].name ?? "Attack")
                        }
                    }
                    .padding(.vertical, 10)
                    
                    Divider()
                        .padding([.leading, .trailing], 20)
                    
                    
                    Text("Resistances")
                        .font(.system(size: 20, weight: .bold))
                    
                    HStack(spacing: 10) {
                        ForEach(0 ..< (viewModel.pokemon.resistances?.count ?? 0), id: \.self) { index in
                            InfoDetailLabel(text: self.viewModel.pokemon.resistances?[index].type ?? "Resistance")
                        }
                    }
                    .padding(.vertical, 10)
                    
                    Divider()
                        .padding([.leading, .trailing], 20)
                    
                    Text("Weaknesses")
                        .font(.system(size: 20, weight: .bold))
                    
                    HStack(spacing: 10) {
                        ForEach(0 ..< (viewModel.pokemon.weaknesses?.count ?? 0), id: \.self) { index in
                            InfoDetailLabel(text: self.viewModel.pokemon.weaknesses?[index].type ?? "Resistance")
                            
                        }
                    }
                    .padding(.vertical, 10)
                    
                }
            }.onAppear{
                self.viewModel.getPokemonInfo()
                
            }.navigationBarTitle("Pokemon Details")
        }
    }
}


struct InfoDetailLabel: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.system(size: 14, weight: .semibold))
            .lineLimit(1)
            .minimumScaleFactor(0.1)
            .padding(10)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(lineWidth: 1)
                
        )
    }
}
