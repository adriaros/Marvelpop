//
//  FavouritesCoordinatorTest.swift
//  MarvelpopUnitTests
//
//  Created by Adrià Ros on 6/7/22.
//

import XCTest
@testable import Marvelpop

final class FavouritesCoordinatorTest: XCTestCase {

    private var sut: FavouritesCoordinator!
    private var viewControllerContainer: FakeViewControllerContainer!

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
    
    func test_pushToCharacterDetail() throws {
        // Given a favourites view controller
        let favouritesViewController = FavouritesViewController()
        viewControllerContainer.fakeFavourites = favouritesViewController
        
        // Given a character detail view controller
        let characterDetailViewController = CharacterDetailViewController()
        viewControllerContainer.fakeCharacterDetail = characterDetailViewController
        
        // Given a spy navigation controller
        let spy = SpyNavigationController(rootViewController: favouritesViewController)
        sut.navigationController = spy
        
        // When the push to character detail is executed
        sut.pushToCharacterDetailWith(id: 0)
        
        // Then the pushed view controller is the character detail
        XCTAssertTrue((spy.pushedViewController as? CharacterDetailViewController) != nil)
    }
}
