//
//  Character.swift
//  Rick and Morty
//
//  Created by pat002900 on 18/11/21.
//

import Foundation
// https://rickandmortyapi.com/documentation/#rest
class Character{
    var id: Int
    var name: String
    var status: String
    var species: String
    var type: String
    var gender: String
    var origin: Location
    var location: Location
    var image: String
    var episode: Episode
    var url: String
    var created: String
     
    init(id:Int, name:String, status:String, species:String, type:String, gender:String, origin:Location, location:Location, image:String, episode:Episode, url:String, created:String) {
        self.id = id
        self.name = name
        self.status = status
        self.species = species
        self.type = type
        self.gender = gender
        self.origin = origin
        self.location = location
        self.image = image
        self.episode = episode
        self.url = url
        self.created = created
    }
}
