//
//  FavouritesRepository.swift
//  Marvelpop
//
//  Created by Adrià Ros on 7/7/22.
//

import Foundation

final class FavouritesRepository: FavouritesRepositoring {
    
    private let dbWrapper: CoreDataFavouriteWrapping
    
    init(dbWrapper: CoreDataFavouriteWrapping) {
        self.dbWrapper = dbWrapper
    }
    
    func save(favourite: Character) {
        dbWrapper.save(favourite: Favourite(favourite))
    }
    
    func fetch(favourite: Character) -> Favourite? {
        dbWrapper.fetch(favourite: Favourite(favourite))
    }
    
    func fetchAll() -> [Favourite] {
        dbWrapper.fetchAll()
    }
    
    func delete(favourite: Character) {
        dbWrapper.delete(favourite: Favourite(favourite))
    }
    
    func deleteAll() {
        dbWrapper.deleteAll()
    }
}
