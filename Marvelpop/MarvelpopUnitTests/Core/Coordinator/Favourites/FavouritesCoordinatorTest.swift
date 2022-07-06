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
    var viewControllerContainer: FakeViewControllerContainer!

    override func setUpWithError() throws {
        viewControllerContainer = FakeViewControllerContainer()
        sut = FavouritesCoordinator(container: viewControllerContainer)
    }

    override func tearDownWithError() throws {
        viewControllerContainer = nil 
        sut = nil
    }

    func test_start() throws {
        // Given a favourites view controller
        let favouritesViewController = FavouritesViewController()
        viewControllerContainer.fakeFavourites = favouritesViewController
        
        // When start is executed
        sut.start()
        
        // Then the coordinator is started correctly
        XCTAssertEqual(sut.navigationController?.viewControllers.first, favouritesViewController)
    }
}
