//
//  Location.swift
//  Rick and Morty
//
//  Created by pat002900 on 18/11/21.
//

import Foundation

struct Location: Decodable {
    var id: Int
    var name: String
    var type: String
    var dimension: String
    var residents: [String]
    var url: String
    var created: String
}

struct AllLocations: Decodable {
    var results: [Location]
}
