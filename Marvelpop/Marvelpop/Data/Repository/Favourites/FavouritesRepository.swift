//
//  FavouritesRepository.swift
//  Marvelpop
//
//  Created by Adrià Ros on 7/7/22.
//

import Foundation

class FavouritesRepository: FavouritesRepositoryProtocol {
    
    let dbWrapper: CoreDataFavouriteWrapperProtocol
    
    init(dbWrapper: CoreDataFavouriteWrapperProtocol) {
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
}
