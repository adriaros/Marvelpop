//
//  FavouritesCoordinatorTest.swift
//  MarvelpopUnitTests
//
//  Created by Adrià Ros on 6/7/22.
//

import XCTest
@testable import Marvelpop

class FavouritesCoordinatorTest: XCTestCase {

    var sut: FavouritesCoordinator!

    override func setUpWithError() throws {
        sut = FavouritesCoordinator()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_start() throws {
        // When start is executed
        sut.start()
        
        // Then the coordinator is started correctly
        XCTAssertTrue(sut.navigationController?.viewControllers.first is FavouritesViewController)
    }
}
