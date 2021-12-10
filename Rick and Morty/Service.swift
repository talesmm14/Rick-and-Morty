//
//  Service.swift
//  Rick and Morty
//
//  Created by pat002900 on 02/12/21.
//

import Foundation
import Alamofire

class Service {
    //https://rickandmortyapi.com/api
    fileprivate var baseUrl = ""
    
    typealias AllCharacterCallBack = (_ method:AllCharacter?, _ status: Bool, _ message:String) -> Void
    typealias AllEpisodeCallBack = (_ method:AllEpisodes?, _ status: Bool, _ message:String) -> Void
    typealias AllLocationCallBack = (_ method:AllLocations?, _ status: Bool, _ message:String) -> Void
    typealias CharacterCallBack = (_ method:Character?, _ status: Bool, _ message:String) -> Void
 
    
    var callBackAllCharacter:AllCharacterCallBack?
    var callBackCharacter:CharacterCallBack?
    var callBackAllLocation:AllLocationCallBack?
    var callBackAllEpisode:AllEpisodeCallBack?
       
    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
   //MARK:- getAllCharacters
    func getAllCharacters(endPoint:String) {
        AF.request(self.baseUrl + endPoint, method: .get, parameters: nil, encoding:     URLEncoding.default, headers: nil, interceptor: nil).response { (responseData) in
            guard let data = responseData.data else {
                self.callBackAllCharacter?(nil, false, "")
                return}
            do {
            let characters = try JSONDecoder().decode(AllCharacter.self, from: data)
                self.callBackAllCharacter?(characters, true,"")
            } catch {
                self.callBackAllCharacter?(nil, false, error.localizedDescription)
            }
           
        }
    }
    
    //MARK:- getAllEpisodes
     func getAllEpisodes(endPoint:String) {
         AF.request(self.baseUrl + endPoint, method: .get, parameters: nil, encoding:     URLEncoding.default, headers: nil, interceptor: nil).response { (responseData) in
             guard let data = responseData.data else {
                 self.callBackAllEpisode?(nil, false, "")
                 return}
             do {
             let episodes = try JSONDecoder().decode(AllEpisodes.self, from: data)
                 self.callBackAllEpisode?(episodes, true,"")
             } catch {
                 self.callBackAllEpisode?(nil, false, error.localizedDescription)
             }
            
         }
     }
    
    //MARK:- getAllLocations
     func getAllLocations(endPoint:String) {
         AF.request(self.baseUrl + endPoint, method: .get, parameters: nil, encoding:     URLEncoding.default, headers: nil, interceptor: nil).response { (responseData) in
             guard let data = responseData.data else {
                 self.callBackAllLocation?(nil, false, "")
                 return}
             do {
             let locations = try JSONDecoder().decode(AllLocations.self, from: data)
                 self.callBackAllLocation?(locations, true,"")
             } catch {
                 self.callBackAllLocation?(nil, false, error.localizedDescription)
             }
            
         }
     }
    
    //MARK:- getAllLocations
     func getCharacter(url:String) {
         AF.request(url, method: .get, parameters: nil, encoding:     URLEncoding.default, headers: nil, interceptor: nil).response { (responseData) in
             guard let data = responseData.data else {
                 self.callBackAllLocation?(nil, false, "")
                 return}
             do {
             let character = try JSONDecoder().decode(AllLocations.self, from: data)
                 self.callBackAllLocation?(character, true,"")
             } catch {
                 self.callBackAllLocation?(nil, false, error.localizedDescription)
             }
            
         }
     }
    
    func completionCharacterHandler(callBackCharacter: @escaping CharacterCallBack) {
        self.callBackCharacter = callBackCharacter
    }
    func completionAllCharacterHandler(callBackCharacter: @escaping AllCharacterCallBack) {
        self.callBackAllCharacter = callBackCharacter
    }
    func completionAllEpisodeHandler(callBackEpisode: @escaping AllEpisodeCallBack) {
        self.callBackAllEpisode = callBackEpisode
    }
    func completionAllLocationHandler(callBackLocation: @escaping AllLocationCallBack) {
        self.callBackAllLocation = callBackLocation
    }
    
}
