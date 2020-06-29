//
//  PokemonTests.swift
//  PokemonTests
//
//  Created by Marco André Marinho Lopes on 25/06/2020.
//  Copyright © 2020 Marco Lopes. All rights reserved.
//

import XCTest
import Foundation
import Combine
@testable import Pokemon

class PokemonTests: XCTestCase {

    func testCoreData() throws {
        let viewModel = PokemonViewModel()
        
        let pokemonToSave = Pokemon(id: "1", name: "Pikachu", imageUrl: "https://images.pokemontcg.io/xy1/42.png")

        viewModel.pokemons.append(pokemonToSave)
        
        viewModel.savePokemons()
        
        viewModel.loadPokemons()
        
        let pokemonSaved = viewModel.pokemons.first
        
        XCTAssertEqual(pokemonToSave, pokemonSaved)
    }
}
