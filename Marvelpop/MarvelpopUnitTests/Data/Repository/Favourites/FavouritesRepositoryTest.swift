//
//  FavouritesRepositoryTest.swift
//  MarvelpopUnitTests
//
//  Created by Adrià Ros on 7/7/22.
//

import XCTest
@testable import Marvelpop

class FavouritesRepositoryTest: XCTestCase {
    
    var sut: FavouritesRepository!
    var dbWrapper: MockCoreDataFavouriteWrapper!

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
        let character = Character(APICharactersResponseModel.Data.Result(id: 1234, name: "Hulk", description: "A Green guy", thumbnail: nil))
        
        // When the character is saved as favourite
        sut.save(favourite: character)
        
        // Then the DB wrapper has saved the favourite
        XCTAssertEqual(dbWrapper.favouriteSaved, Favourite(character))
    }
    
    func test_fetch() throws {
        // Given a character saved as favourite
        let character = Character(APICharactersResponseModel.Data.Result(id: 1234, name: "Hulk", description: "A Green guy", thumbnail: nil))
        dbWrapper.mockFavourite = Favourite(character)
        
        // When the favourite is fetched
        let fetchedFavourite = sut.fetch(favourite: character)
        
        // Then the DB wrapper returns the saved favourite
        XCTAssertEqual(fetchedFavourite, Favourite(character))
    }
    
    func test_fetchAll() throws {
        // Given a favourite saved
        let favourite = Favourite(Character(APICharactersResponseModel.Data.Result(id: 1234, name: "Hulk", description: "A Green guy", thumbnail: nil)))
        dbWrapper.mockFavourites = [favourite]
        
        // When the favourite are fetched
        let fetchedFavourites = sut.fetchAll()
        
        // Then the DB wrapper returns the saved favourites
        XCTAssertEqual(fetchedFavourites.count, 1)
    }
    
    func test_delete() throws {
        // Given a character
        let character = Character(APICharactersResponseModel.Data.Result(id: 1234, name: "Hulk", description: "A Green guy", thumbnail: nil))
        
        // When the favourite is deleted
        sut.delete(favourite: character)
        
        // Then the DB wrapper has deleted the favourite
        XCTAssertEqual(dbWrapper.favouriteDeleted, Favourite(character))
    }
}
