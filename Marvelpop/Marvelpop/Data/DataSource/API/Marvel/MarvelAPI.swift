//
//  MarvelAPI.swift
//  Marvelpop
//
//  Created by Adrià Ros on 6/7/22.
//

import UIKit

class MarvelAPI: MarvelAPIProtocol {
    
    var session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func process(request: NetworkRequest, _ completion: @escaping (HTTPStatusCode, Data?) -> Void) {
        
        var components = URLComponents(string: APIEndPoint.Marvel.Scheme + APIEndPoint.Marvel.Host + request.path)
        
        components?.queryItems = [
            URLQueryItem(name: "ts", value: APIEndPoint.Marvel.Ts),
            URLQueryItem(name: "apikey", value: APIKeys.Marvel.Key),
            URLQueryItem(name: "hash", value: APIEndPoint.Marvel.Hash)
        ]
        
        if let queryItems = request.queryItems {
            components?.queryItems?.append(contentsOf: queryItems.map({ URLQueryItem(name: $0.name, value: $0.value) }))
        }
        
        guard let url = components?.url else {
            fatalError("Fatal error. Unable to get the URL from URLComponents \(String(describing: components))")
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        
        session.dataTask(with: urlRequest) { data, response, error in
            guard error == nil else {
                completion(.serverError, nil)
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(.unknown, nil)
                return
            }
            
            let statusCode = HTTPStatusCode(statusCode: response.statusCode)
            
            guard statusCode == .success else {
                completion(statusCode, nil)
                return
            }
            
            completion(statusCode, data)
        }.resume()
    }
    
    func download(imageFrom url: URL?, completion: @escaping (_ data: UIImage?) -> Void) {
        guard let url = url else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else {
                completion(nil)
                return
            }
            
            completion(UIImage(data: data))
        }.resume()
    }
}
