//
//  MockFavouritesRepository.swift
//  MarvelpopUnitTests
//
//  Created by Adrià Ros on 7/7/22.
//

import Foundation
@testable import Marvelpop

final class MockFavouritesRepository: FavouritesRepositoryProtocol {
    
    var favouriteCharacterSaved: Character?
    var mockCharacterFavourite: Character?
    var mockFavourites: [Favourite]?
    var favouriteCharacterDeleted: Character?
    var deletedAllCalled = false
    
    func save(favourite: Character) {
        favouriteCharacterSaved = favourite
    }
    
    func fetch(favourite: Character) -> Favourite? {
        mockCharacterFavourite == nil ? nil : Favourite(mockCharacterFavourite!)
    }
    
    func fetchAll() -> [Favourite] {
        mockFavourites ?? []
    }
    
    func delete(favourite: Character) {
        favouriteCharacterDeleted = favourite
    }
    
    func deleteAll() {
        mockFavourites?.removeAll()
        deletedAllCalled = true
    }
}
