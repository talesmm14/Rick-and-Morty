//
//  Location.swift
//  Rick and Morty
//
//  Created by pat002900 on 18/11/21.
//

import Foundation

struct Location: Codable {
    var id: Int
    var name: String
    var type: String
    var dimension: String
    var residents: [Character]
    var url: String
    var created: String
}
