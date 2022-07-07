//
//  ViewControllerContainerTest.swift
//  MarvelpopUnitTests
//
//  Created by Adrià Ros on 7/7/22.
//

import XCTest
@testable import Marvelpop

class ViewControllerContainerTest: XCTestCase {
    
    var sut: ViewControllerFactory!
    var container: FakeDependencyContainer!

    override func setUpWithError() throws {
        container = FakeDependencyContainer()
        sut = ViewControllerContainer(container: container)
    }

    override func tearDownWithError() throws {
        container = nil
        sut = nil
    }

    func test_makeTabBar() throws {
        // When the make tab bar method is executed
        let tabBarController = sut.makeTabBar()
        
        // Then the tab bar is created and customized correctly
        XCTAssertEqual(tabBarController.tabBar.tintColor, .black)
    }
    
    func test_makeHome() throws {
        // Given the data providers
        container.mockCharactersRepository = MockCharactersRepository()
        container.mockImageLoaderUseCase = MockImageLoaderUseCase()
        
        // Given a home coordinator
        let coordinator = FakeHomeCoordinator()
        
        // When the make home method is executed
        let homeViewController = sut.makeHome(coordinator: coordinator)
        
        // Then the view controller is created
        XCTAssertTrue(homeViewController.view != nil)
    }

    func test_makeFavourites() throws {
        // Given the data providers
        container.mockFavouritesRepository = MockFavouritesRepository()
        container.mockImageLoaderUseCase = MockImageLoaderUseCase()
        
        // Given a favourites coordinator
        let coordinator = FakeFavouritesCoordinator()
        
        // When the make home method is executed
        let favouritesViewController = sut.makeFavourites(coordinator: coordinator)
        
        // Then the view controller is created
        XCTAssertTrue(favouritesViewController.view != nil)
    }
    
    func test_makeCharacterDetail() throws {
        // Given the data providers
        container.mockCharactersRepository = MockCharactersRepository()
        container.mockFavouritesRepository = MockFavouritesRepository()
        container.mockImageLoaderUseCase = MockImageLoaderUseCase()
        
        // When the make home method is executed
        let characterDetailViewController = sut.makeCharacterDetail(characterID: 1)
        
        // Then the view controller is created
        XCTAssertTrue(characterDetailViewController.view != nil)
    }
}
