//
//  Location.swift
//  Rick and Morty
//
//  Created by pat002900 on 18/11/21.
//

import Foundation

class Location{
    var id: Int
    var name: String
    var type: String
    var dimension: String
    var residents: Character
    var url: String
    var created: String
    
    init(id:Int, name:String, type:String, dimension:String, residents:Character, url:String, created:String) {
        self.id = id
        self.name = name
        self.type = type
        self.dimension = dimension
        self.residents = residents
        self.url = url
        self.created = created
    }
}
