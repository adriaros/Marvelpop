//
//  FakeMarvelAPI.swift
//  MarvelpopUnitTests
//
//  Created by Adrià Ros on 6/7/22.
//

import UIKit
@testable import Marvelpop

class FakeMarvelAPI: MarvelAPIProtocol {
    
    var code: HTTPStatusCode!
    var jsonFile: String?
    var image: UIImage?
    
    let bundle: Bundle!
    
    init() {
        bundle = Bundle(for: type(of: self ))
    }
    
    func process(request: NetworkRequest, _ completion: @escaping (HTTPStatusCode, Data?) -> Void) {
        guard let jsonFile = jsonFile else {
            completion(code ?? .unknown, nil)
            return
        }
        
        guard let path = bundle.path(forResource: jsonFile, ofType: "json") else {
            completion(code ?? .unknown, nil)
            return
        }
        
        do {
            let jsonData = try NSData(contentsOfFile: path, options: .mappedIfSafe) as Data
            completion(code, jsonData)
        } catch {
            completion(code, nil)
        }
    }
    
    func download(imageFrom url: URL?, completion: @escaping (_ data: UIImage?) -> Void) {
        completion(image)
    }
}
