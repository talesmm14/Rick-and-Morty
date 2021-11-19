//
//  Characters.swift
//  Rick and Morty
//
//  Created by pat002900 on 18/11/21.
//

import Foundation

class Characters{
    var name: String
    var status: String
    var species: String
    var type: String
    var gender: String
    var origin: Location
    var location: Location
    var image: String
    var episode: String
    var url: String
    var created: String
    
    init(name:String, descricao:String, categoria:String, preco:String, img:String) {
        self.name = name
        self.descricao = descricao
        self.categoria = categoria
        self.preco = preco
        self.img = img
    }
    
}
