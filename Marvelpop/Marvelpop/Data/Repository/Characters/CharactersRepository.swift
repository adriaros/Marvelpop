//
//  CharactersRepository.swift
//  Marvelpop
//
//  Created by Adrià Ros on 7/7/22.
//

import Foundation

final class CharactersRepository: CharactersRepositoryProtocol {
    
    private let api: MarvelAPIProtocol
    
    init(api: MarvelAPIProtocol) {
        self.api = api
    }

    func getCharacterList(request: CharacterListRequest, completion: @escaping (_ data: [Character], _ pagination: Pagination?, _ error: ErrorType?) -> Void) {
        let networkRequest = NetworkRequest(path: APIEndPoint.Marvel.Get.characters, method: .get, queryItems: request.queryItems)
        api.process(request: networkRequest) { code, data in
            if code != .success {
                completion([], nil, .api(code))
                return
            }
            
            let decodedData: APICharactersResponseModel? = JSONDecoder().decode(data: data)
            guard let safeData = decodedData?.data, let results = safeData.results else {
                completion([], nil, .decoding)
                return
            }
            
            let characters = results.compactMap({ $0.id != nil ? Character($0) : nil })
            let pagination = Pagination(offset: safeData.offset, total: safeData.total, count: safeData.count, limit: safeData.limit)
            
            completion(characters, pagination, nil)
        }
    }
    
    func getCharacterWith(id: Int?, completion: @escaping (_ data: Character?, _ error: ErrorType?) -> Void) {
        guard let id = id else {
            completion(nil, .unknown)
            return
        }

        let networkRequest = NetworkRequest(path: String(format: APIEndPoint.Marvel.Get.character, String(id)), method: .get)
        api.process(request: networkRequest) { code, data in
            if code != .success {
                completion(nil, .api(code))
                return
            }
            
            let decodedData: APICharactersResponseModel? = JSONDecoder().decode(data: data)
            guard let result = decodedData?.data?.results?.first else {
                completion(nil, .decoding)
                return
            }
            
            completion(Character(result), nil)
        }
    }
}
