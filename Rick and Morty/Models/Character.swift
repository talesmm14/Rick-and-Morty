//
//  Character.swift
//  Rick and Morty
//
//  Created by pat002900 on 18/11/21.
//

import Foundation
// https://rickandmortyapi.com/documentation/#rest
struct Character: Codable {
    var id: Int
    var name: String
    var status: String
    var species: String
    var type: String
    var gender: String
    var origin: Location
    var location: Location
    var image: String
    var episode: [Episode]
    var url: String
    var created: String
}
