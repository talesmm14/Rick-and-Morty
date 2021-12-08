//
//  Repository.swift
//  Rick and Morty
//
//  Created by pat002900 on 02/12/21.
//

import Foundation

struct Parser {
    func parse(comp: @escaping (AllCharacter)->()) {
        let api = URL(string: "https://rickandmortyapi.com/api/character")
        
        URLSession.shared.dataTask(with: api!){
            data, response, error in
            if error != nil{
                print(error?.localizedDescription ?? "")
                return
            }
            do {
                let result = try JSONDecoder().decode(AllCharacter.self, from: data!)
                comp(result)
            } catch {
                
            }
        }.resume()
    }
}
