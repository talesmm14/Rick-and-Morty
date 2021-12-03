//
//  Service.swift
//  Rick and Morty
//
//  Created by pat002900 on 02/12/21.
//

import Foundation
import Alamofire

class Service {
    //https://restcountries.eu/rest/v2
       fileprivate var baseUrl = "https://rickandmortyapi.com/api"
       typealias methodCallBack = (_ method:String?, _ status: Bool, _ message:String) -> Void
       
       var callBack:methodCallBack?
       
       init(baseUrl: String) {
           self.baseUrl = baseUrl
       }
       
       //MARK:- getAllCountryNameFrom
       func getAllCountryNameFrom(endPoint:String) {
           AF.request(self.baseUrl + endPoint, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { (responseData) in
               guard let data = responseData.data else {
                   self.callBack?(nil, false, "")

                   return}
               do {
               let countries = try JSONDecoder().decode([Country].self, from: data)
                   self.callBack?(countries, true,"")
               } catch {
                   self.callBack?(nil, false, error.localizedDescription)
               }
               
           }
       }
       
       func completionHandler(callBack: @escaping methodCallBack) {
           self.callBack = callBack
       }
}
