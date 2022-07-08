//
//  APICharactersResponseModel.swift
//  Marvelpop
//
//  Created by Adrià Ros on 7/7/22.
//

import Foundation

struct APICharactersResponseModel: Codable {
    let data: Data?
}

extension APICharactersResponseModel {
    
    struct Data: Codable {
        let offset: Int?
        let total: Int?
        let count: Int?
        let limit: Int?
        let results: [Result]?
    }
}

extension APICharactersResponseModel.Data {
    
    struct Result: Codable {
        let id: Int?
        let name: String?
        let description: String?
        let thumbnail: Thumbnail?
        let comics: Comics?
    }
}

extension APICharactersResponseModel.Data.Result {
    
    struct Thumbnail: Codable {
        let path: String?
        let ext: String?

        enum CodingKeys: String, CodingKey {
            case path
            case ext = "extension"
        }
    }
    
    struct Comics: Codable {
        let items: [ComicsItem]
    }
}

extension APICharactersResponseModel.Data.Result.Comics {
    
    struct ComicsItem: Codable {
        let resourceURI: String
        let name: String
    }
}
