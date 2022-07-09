//
//  CoreDataFavouriteWrapperTest.swift
//  MarvelpopUnitTests
//
//  Created by Adrià Ros on 7/7/22.
//

import XCTest
@testable import Marvelpop

final class CoreDataFavouriteWrapperTest: XCTestCase {
    
    private var sut: CoreDataFavouriteWrapper!
    private var manager: CoreDataManaging!

    private let favourite = Favourite(Character(APICharactersResponseModel.Data.Result(id: 1234, name: "Hulk", description: "A Green guy", thumbnail: nil, comics: nil)))

    override func setUpWithError() throws {
        manager = CoreDataManager(.inMemory)
        sut = CoreDataFavouriteWrapper(manager: manager)
    }

    override func tearDownWithError() throws {
        manager = nil
        sut = nil
    }
    
    func test_wrapper() throws {
        // Given two favourites
        let Hulk = Favourite(Character(APICharactersResponseModel.Data.Result(id: 1234, name: "Hulk", description: "A Green guy", thumbnail: nil, comics: nil)))
        let Has = Favourite(Character(APICharactersResponseModel.Data.Result(id: 1234, name: "Has", description: "A Blue guy", thumbnail: nil, comics: nil)))
        
        // When the favourites are saved
        sut.save(favourite: Hulk)
        sut.save(favourite: Has)
        
        // Then the favourites are stored and can be fetched correctly
        XCTAssertEqual(sut.fetchAll().count, 2)
        XCTAssertEqual(sut.fetch(favourite: Hulk), Hulk)

        // When the favourite "Hulk" is deleted
        sut.delete(favourite: Hulk)
        
        // Then the favourite Hulk has been deleted
        XCTAssertEqual(sut.fetchAll().count, 1)
        
        // When all the favourites are deleted
        sut.deleteAll()
        
        // Then the saved favourites are 0
        XCTAssertEqual(sut.fetchAll().count, 0)
    }
}
