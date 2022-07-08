//
//  MockCharactersRepository.swift
//  MarvelpopUnitTests
//
//  Created by Adrià Ros on 7/7/22.
//

import Foundation
@testable import Marvelpop

class MockCharactersRepository: CharactersRepositoryProtocol {
    
    var characterList: [Character] = []
    var pagination: Pagination?
    var character: Character?
    var error: ErrorType?
    
    func getCharacterList(request: CharacterListRequest, completion: @escaping (_ data: [Character], _ pagination: Pagination?, _ error: ErrorType?) -> Void) {
        completion(characterList, pagination, error)
    }
    
    func getCharacterWith(id: Int?, completion: @escaping (Character?, ErrorType?) -> Void) {
        completion(character, error)
    }
}
