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
        
        // Then the favourite is saved and fetched correctly
        XCTAssertEqual(fetchedFavourite, favourite)
    }
    
    func test_saveAndFetchAll() throws {
        // Given a saved favourite
        let favourite = Favourite(Character(APICharactersResponseModel.Data.Result(id: 1234, name: "Hulk", description: "A Green guy", thumbnail: nil)))
        sut.save(favourite: favourite)
        
        // When the favourite is fetched
        let fetchedFavourites = sut.fetchAll()
        
        // Then the favourite is saved and fetched correctly
        XCTAssertEqual(fetchedFavourites.count, 1)
    }
    
    func test_saveAndDelete() throws {
        // Given a saved favourite
        let favourite = Favourite(Character(APICharactersResponseModel.Data.Result(id: 1234, name: "Hulk", description: "A Green guy", thumbnail: nil)))
        sut.save(favourite: favourite)
        
        // When the favourite is deleted
        sut.delete(favourite: favourite)
        
        // Then the favourite is saved and deleted correctly
        XCTAssertEqual(sut.fetchAll().count, 0)
    }
    
    func test_saveAndDeleteAll() throws {
        // Given a saved favourite
        let favourite0 = Favourite(Character(APICharactersResponseModel.Data.Result(id: 1234, name: "Hulk", description: "A Green guy", thumbnail: nil)))
        let favourite1 = Favourite(Character(APICharactersResponseModel.Data.Result(id: 1234, name: "Has", description: "A Blue guy", thumbnail: nil)))
        sut.save(favourite: favourite0)
        sut.save(favourite: favourite1)
        
        // When the favourites are deleted
        sut.deleteAll()
        
        // Then the favourites are saved and deleted correctly
        XCTAssertEqual(sut.fetchAll().count, 0)
    }
}
