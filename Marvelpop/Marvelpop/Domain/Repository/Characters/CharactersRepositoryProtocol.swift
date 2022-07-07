//
//  CharactersRepositoryProtocol.swift
//  Marvelpop
//
//  Created by Adrià Ros on 7/7/22.
//

import Foundation

protocol CharactersRepositoryProtocol {
    func getCharacterList(request: CharacterListRequest, completion: @escaping (_ data: [Character], _ pagination: Pagination?, _ error: ErrorType?) -> Void)
    func getCharacterWith(id: Int?, completion: @escaping (_ data: Character?) -> Void)
}
