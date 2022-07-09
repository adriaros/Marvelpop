//
//  FavouritesRepositoryTest.swift
//  MarvelpopUnitTests
//
//  Created by Adrià Ros on 7/7/22.
//

import XCTest
@testable import Marvelpop

final class FavouritesRepositoryTest: XCTestCase {
    
    private var sut: FavouritesRepository!
    private var dbWrapper: MockCoreDataFavouriteWrapper!
    
    private let character = Character(APICharactersResponseModel.Data.Result(id: 1234, name: "Hulk", description: "A Green guy", thumbnail: nil, comics: nil))

    override func setUpWithError() throws {
        dbWrapper = MockCoreDataFavouriteWrapper()
        sut = FavouritesRepository(dbWrapper: dbWrapper)
    }

    override func tearDownWithError() throws {
        dbWrapper = nil
        sut = nil
    }

    func test_save() throws {
        // Given a character
        
        // When the character is saved as favourite
        sut.save(favourite: character)
        
        // Then the DB wrapper has saved the favourite
        XCTAssertEqual(dbWrapper.favouriteSaved, Favourite(character))
    }
    
    func test_fetch() throws {
        // Given a character saved as favourite
        dbWrapper.mockFavourite = Favourite(character)
        
        // When the favourite is fetched
        let fetchedFavourite = sut.fetch(favourite: character)
        
        // Then the DB wrapper returns the saved favourite
        XCTAssertEqual(fetchedFavourite, Favourite(character))
    }
    
    func test_fetchAll() throws {
        // Given a favourite saved
        dbWrapper.mockFavourites = [Favourite(character)]
        
        // When the favourite are fetched
        let fetchedFavourites = sut.fetchAll()
        
        // Then the DB wrapper returns the saved favourites
        XCTAssertEqual(fetchedFavourites.count, 1)
    }
    
    func test_delete() throws {
        // Given a character
        
        // When the favourite is deleted
        sut.delete(favourite: character)
        
        // Then the DB wrapper has deleted the favourite
        XCTAssertEqual(dbWrapper.favouriteDeleted, Favourite(character))
    }
    
    func test_deleteAll() throws {
        // When the favourites are deleted
        sut.deleteAll()
        
        // Then the DB wrapper has deleted the favourites
        XCTAssertTrue(dbWrapper.deletedAllCalled)
    }
}
