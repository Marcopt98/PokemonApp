//
//  PokemonUITests.swift
//  PokemonUITests
//
//  Created by Marco André Marinho Lopes on 25/06/2020.
//  Copyright © 2020 Marco Lopes. All rights reserved.
//

import XCTest

class PokemonUITests: XCTestCase {
    
    func testCoreData() {
        let app = XCUIApplication()
        app.launch()
        
        app.navigationBars["Pokemons"].buttons["Save"].tap()
        app.navigationBars["Pokemons"].buttons["Load"].tap()
        
        let itemCount = app.tables.children(matching: .cell).count

        print(itemCount)
        XCTAssert(itemCount > 0)
    }
    
    func testDetailsView() {
        let app = XCUIApplication()
        app.launch()
        
        let cell = app.tables.children(matching: .cell).firstMatch
        cell.tap()
        
        let pokemonName = app.staticTexts["Bellossom"].label
        
        XCTAssertEqual(pokemonName, "Bellossom")
    }
    
    func testAPISearch() {
        let app = XCUIApplication()
        let pokemonToSearch = "Cubone"
        app.launch()
        
        app.textFields["Search Pokemon"].tap()
        app.typeText(pokemonToSearch)
        app.buttons["Search"].tap()
        
        
        let cell = app.tables.children(matching: .cell).firstMatch
        cell.tap()
        
        let pokemonName = app.staticTexts[pokemonToSearch].label
        
        XCTAssertEqual(pokemonName, pokemonToSearch)
    }
}
