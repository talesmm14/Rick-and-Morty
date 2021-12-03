//
//  Repository.swift
//  Rick and Morty
//
//  Created by pat002900 on 02/12/21.
//

import Foundation

struct Info: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}

enum NetworkHandlerError: Error {
    case invalidURL
    case invalidResponse(error: ErrorMessage)
    case apiError
    case decodingError
}

struct ErrorMessage: Codable {
    let error: String
}

public struct NetworkHandler {
    var baseURL: String = "https://rickandmortyapi.com/api/"
   
    func performAPIRequestByMethod(method: String, completion: @escaping (Result<Data, NetworkHandlerError>) -> Void) {
        if let url = URL(string: baseURL+method) {
            print("HTTP-Request: "+baseURL+method)
            let urlSession = URLSession.shared
            urlSession.dataTask(with: url) {
                switch $0 {
                case .success(let (response, data)):
                guard let statusCode = (response as? HTTPURLResponse)?.statusCode, 200..<299 ~= statusCode else {
                    completion(.failure(.invalidResponse(error: decodeError(data: data) ?? ErrorMessage(error: "invalidResponse"))))
                    return
                }
                completion(.success(data))
                case .failure( _):
                completion(.failure(.apiError))
                }
            }.resume()
        } else {
            completion(.failure(.invalidURL))
        }
    }
    
    func performAPIRequestByURL(url: String, completion: @escaping (Result<Data, NetworkHandlerError>) -> Void) {
        if let url = URL(string: url) {
            print(url)
            let urlSession = URLSession.shared
            urlSession.dataTask(with: url) {
                switch $0 {
                case .success(let (response, data)):
                guard let statusCode = (response as? HTTPURLResponse)?.statusCode, 200..<299 ~= statusCode else {
                    completion(.failure(.invalidResponse(error: decodeError(data: data) ?? ErrorMessage(error: "invalidResponse"))))
                    return
                }
                completion(.success(data))
                case .failure( _):
                completion(.failure(.apiError))
                }
            }.resume()
        } else {
            completion(.failure(.invalidURL))
        }
    }
    
    func decodeJSONData<T: Codable>(data: Data) -> T? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(T.self, from: data)
            return decodedData
        } catch {
            print(error)
            return nil
        }
    }
    
    func decodeError(data: Data) -> ErrorMessage? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(ErrorMessage.self, from: data)
            return decodedData
        } catch {
            print(error)
            return nil
        }
    }
}

extension URLSession {
    func dataTask(with url: URL, result: @escaping (Result<(URLResponse, Data), Error>) -> Void) -> URLSessionDataTask {
        return dataTask(with: url) { (data, response, error) in
            if let error = error {
                result(.failure(error))
                return
            }
            guard let response = response, let data = data else {
                let error = NSError(domain: "error", code: 0, userInfo: nil)
                result(.failure(error))
                return
            }
            result(.success((response, data)))
        }
    }
}
