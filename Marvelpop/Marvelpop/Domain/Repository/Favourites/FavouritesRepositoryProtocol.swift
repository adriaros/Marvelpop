//
//  FavouritesRepositoryProtocol.swift
//  Marvelpop
//
//  Created by Adrià Ros on 7/7/22.
//

import Foundation

protocol FavouritesRepositoryProtocol {
    func save(favourite: Character)
    func fetch(favourite: Character) -> Favourite?
    func fetchAll() -> [Favourite]
    func delete(favourite: Character)
    func deleteAll()
}
