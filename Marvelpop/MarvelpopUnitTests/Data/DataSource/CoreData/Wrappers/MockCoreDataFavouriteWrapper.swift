//
//  MockCoreDataFavouriteWrapper.swift
//  MarvelpopUnitTests
//
//  Created by Adrià Ros on 7/7/22.
//

import Foundation
@testable import Marvelpop

class MockCoreDataFavouriteWrapper: CoreDataFavouriteWrapperProtocol {
    
    var favouriteSaved: Favourite?
    var mockFavourite: Favourite?
    var mockFavourites: [Favourite]?
    var favouriteDeleted: Favourite?
    var deletedAllCalled = false
    
    func save(favourite: Favourite) {
        favouriteSaved = favourite
    }
    
    func fetch(favourite: Favourite) -> Favourite? {
        mockFavourite
    }
    
    func fetchAll() -> [Favourite] {
        mockFavourites ?? []
    }
    
    func delete(favourite: Favourite) {
        favouriteDeleted = favourite
    }
    
    func deleteAll() {
        deletedAllCalled = true
    }
}
