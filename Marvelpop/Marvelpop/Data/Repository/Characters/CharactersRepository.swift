//
//  CharactersRepository.swift
//  Marvelpop
//
//  Created by Adrià Ros on 7/7/22.
//

import Foundation

class CharactersRepository: CharactersRepositoryProtocol {
    
    var api: MarvelAPIProtocol
    
    init(api: MarvelAPIProtocol) {
        self.api = api
    }

    func getCharacterList(request: CharacterListRequest, completion: @escaping (_ data: [Character], _ pagination: Pagination?, _ error: ErrorType?) -> Void) {
        let networkRequest = NetworkRequest(path: APIEndPoint.Marvel.Get.characters, method: .get, queryItems: [request.limitQuery, request.offsetQuery])
        api.process(request: networkRequest) { code, data in
            guard code == .success else {
                completion([], nil, .api(code))
                return
            }
            
            guard let decodedData: APICharactersResponseModel? = JSONDecoder().decode(data: data) else {
                completion([], nil, .decoding)
                return
            }
            
            guard let safeData = decodedData?.data, let results = safeData.results else {
                completion([], nil, .decoding)
                return
            }
            
            let characters = results.compactMap({ $0.id != nil ? Character($0) : nil })
            let pagination = Pagination(offset: safeData.offset, total: safeData.total, count: safeData.count, limit: safeData.limit)
            
            completion(characters, pagination, nil)
        }
    }
    
    func getCharacterWith(id: Int?, completion: @escaping (_ data: Character?) -> Void) {
        guard let id = id else {
            return
        }

        let networkRequest = NetworkRequest(path: String(format: APIEndPoint.Marvel.Get.character, String(id)), method: .get)
        api.process(request: networkRequest) { _, data in
            guard let decodedData: APICharactersResponseModel? = JSONDecoder().decode(data: data) else {
                completion(nil)
                return
            }
            
            guard let result = decodedData?.data?.results?.first else {
                completion(nil)
                return
            }
            
            completion(Character(result))
        }
    }
}