struct PokemonDetails: Decodable, Equatable {
    var id: String
    var name: String
    var imageUrlHiRes: String
    var types: [String]?
    var supertype: String
    var hp : String?
    var number: String
    var rarity: String?
    var artist: String
    var attacks: [Attacks]?
    var resistances: [Resistances]?
    var weaknesses: [Weaknesses]?
    
    init() {
        id = ""
        name = ""
        imageUrlHiRes = ""
        supertype = ""
        number = ""
        artist = ""
    }
}
