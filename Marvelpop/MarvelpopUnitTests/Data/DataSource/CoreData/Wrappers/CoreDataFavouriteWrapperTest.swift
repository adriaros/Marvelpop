//
//  CoreDataFavouriteWrapperTest.swift
//  MarvelpopUnitTests
//
//  Created by Adrià Ros on 7/7/22.
//

import XCTest
@testable import Marvelpop

class CoreDataFavouriteWrapperTest: XCTestCase {
    
    var sut: CoreDataFavouriteWrapper!
    var manager: CoreDataManagerProtocol!

    override func setUpWithError() throws {
        manager = CoreDataManager(.inMemory)
        sut = CoreDataFavouriteWrapper(manager: manager)
    }

    override func tearDownWithError() throws {
        manager = nil
        sut = nil
    }

    func test_saveAndFetch() throws {
        // Given a saved favourite
        let favourite = Favourite(Character(APICharactersResponseModel.Data.Result(id: 1234, name: "Hulk", description: "A Green guy", thumbnail: nil)))
        sut.save(favourite: favourite)
        
        // When the favourite is fetched
        let fetchedFavourite = sut.fetch(favourite: favourite)
        
        // Then the CoreData has saved and returned the favourite
        XCTAssertEqual(fetchedFavourite, favourite)
    }
    
    func test_saveAndFetchAll() throws {
        // Given a saved favourite
        let favourite = Favourite(Character(APICharactersResponseModel.Data.Result(id: 1234, name: "Hulk", description: "A Green guy", thumbnail: nil)))
        sut.save(favourite: favourite)
        
        // When the favourite is fetched
        let fetchedFavourites = sut.fetchAll()
        
        // Then the CoreData has saved and returned the favourites
        XCTAssertEqual(fetchedFavourites.count, 1)
    }
    
    func test_saveAndDelete() throws {
        // Given a saved favourite
        let favourite = Favourite(Character(APICharactersResponseModel.Data.Result(id: 1234, name: "Hulk", description: "A Green guy", thumbnail: nil)))
        sut.save(favourite: favourite)
        
        // When the favourite is deleted
        sut.delete(favourite: favourite)
        
        // Then the CoreData has saved and returned the favourites
        XCTAssertEqual(sut.fetchAll().count, 0)
    }
}
