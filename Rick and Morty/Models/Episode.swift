//
//  Episode.swift
//  Rick and Morty
//
//  Created by pat002900 on 18/11/21.
//

import Foundation

struct Episode: Codable {
    var id: Int
    var name: String
    var air_date: String
    var episode: String
    var characters: [Character]
    var url: String
    var created: String
}
