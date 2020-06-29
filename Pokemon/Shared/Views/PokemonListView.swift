import SwiftUI
import CoreData

struct PokemonListView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @ObservedObject var viewModel = PokemonListViewModel()
    
    var body: some View {
        NavigationView {
            
            VStack {
                SearchPokemonBar(text: $viewModel.name) {
                    self.endEditing()
                    self.viewModel.resetSearch()
                    self.viewModel.search()
                }
                
                List(viewModel.pokemons) { thisPokemon in
                    
                    PokemonRow(pokemon: thisPokemon).onAppear (perform: {
                        
                        if !self.viewModel.endOfList{
                            if self.viewModel.shouldLoadMore(pokemon: thisPokemon){
                                self.viewModel.search()
                            }
                        }
                    })
                }
                
            }.alert(isPresented: $viewModel.endOfList) {
                Alert(title: Text("Oops"), message: Text("An Error Occurred"), dismissButton: .default(Text("OK")))
            }
            .navigationBarTitle(Text("Pokemons"))
            .navigationBarItems(leading: HStack{
                NavigationButton(text: "Save", tapAction: self.viewModel.savePokemons)
                Spacer()
                NavigationButton(text: "Load", tapAction: self.viewModel.loadPokemons)
            })
        }
        .navigationViewStyle(StackNavigationViewStyle())
//        .navigationViewStyle(DoubleColumnNavigationViewStyle())
//        .padding()
        .onAppear {
            self.viewModel.search()
            self.viewModel.objectContext = self.managedObjectContext
        }
    }
    
    private func endEditing() {
        UIApplication.shared.endEditing()
    }
}


struct NavigationButton: View {
    let text: String
    let tapAction: () -> Void
    
    var body: some View {
        Button(action: tapAction, label: {
            Text(text)
        })
    }
}


#if DEBUG
struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}
#endif
