struct Pokemon: Identifiable, Hashable, Decodable, Equatable {
    var id: String
    var name: String
    var imageUrl: String
    var subtype: String
    var rarity: String
}

