//
//  Episode.swift
//  Rick and Morty
//
//  Created by pat002900 on 18/11/21.
//

import Foundation

class Episode{
    var id: Int
    var name: String
    var air_date: String
    var episode: String
    var characters: Character
    var url: String
    var created: String
    
    init(id:Int, name:String, air_date:String, episode:String, characters:Character, url:String, created:String) {
        self.id = id
        self.name = name
        self.air_date = air_date
        self.episode = episode
        self.characters = characters
        self.url = url
        self.created = created
    }
}
