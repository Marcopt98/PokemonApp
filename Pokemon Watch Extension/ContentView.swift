//
//  ContentView.swift
//  Pokemon Watch Extension
//
//  Created by Marco André Marinho Lopes on 25/06/2020.
//  Copyright © 2020 Marco Lopes. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = PokemonListViewModel()
    
    var body: some View {
        VStack{
            List(viewModel.pokemons) { thisPokemon in
                
                PokemonRow(pokemon: thisPokemon).onAppear (perform: {
                    
                    if !self.viewModel.endOfList{
                        if self.viewModel.shouldLoadMore(pokemon: thisPokemon){
                            self.viewModel.search()
                        }
                    }
                })
                
                
            }
        }.onAppear{
            self.viewModel.search()
        }
        
    }
}
