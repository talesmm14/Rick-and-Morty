//
//  Character.swift
//  Rick and Morty
//
//  Created by pat002900 on 18/11/21.
//

import Foundation
// https://rickandmortyapi.com/documentation/#rest
struct Character: Decodable {
    var id: Int
    var name: String
    var status: String
    var species: String
    var type: String
    var gender: String
    var image: String
    var url: String
    var created: String
    var episode: [String]
    var location: CharacterLocation
    var origin: CharacterLocation
}

struct CharacterLocation: Decodable {
    var name: String
}

struct AllCharacter: Decodable {
    var results: [Character]
}

