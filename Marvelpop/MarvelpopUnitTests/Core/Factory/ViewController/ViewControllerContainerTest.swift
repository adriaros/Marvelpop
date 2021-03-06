//
//  ViewControllerContainerTest.swift
//  MarvelpopUnitTests
//
//  Created by Adrià Ros on 7/7/22.
//

import XCTest
@testable import Marvelpop

final class ViewControllerContainerTest: XCTestCase {
    
    private var sut: ViewControllerFactory!
    private var container: FakeDependencyContainer!
    private var characters: MockCharactersRepository!
    private var favourites: MockFavouritesRepository!
    private var imageLoader: MockImageLoader!

    override func setUpWithError() throws {
        container = FakeDependencyContainer()
        sut = ViewControllerContainer(container: container)
        characters = MockCharactersRepository()
        favourites = MockFavouritesRepository()
        imageLoader = MockImageLoader()
    }

    override func tearDownWithError() throws {
        imageLoader = nil
        favourites = nil
        characters = nil
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
        container.mockCharactersRepository = characters
        container.mockImageLoader = imageLoader
        
        // Given a home coordinator
        let coordinator = FakeHomeCoordinator()
        
        // When the make home method is executed
        let homeViewController = sut.makeHome(coordinator: coordinator)
        
        // Then the view controller is created
        XCTAssertTrue(homeViewController.view != nil)
    }

    func test_makeFavourites() throws {
        // Given the data providers
        container.mockFavouritesRepository = favourites
        container.mockImageLoader = imageLoader
        
        // Given a favourites coordinator
        let coordinator = FakeFavouritesCoordinator()
        
        // When the make home method is executed
        let favouritesViewController = sut.makeFavourites(coordinator: coordinator)
        
        // Then the view controller is created
        XCTAssertTrue(favouritesViewController.view != nil)
    }
    
    func test_makeCharacterDetail() throws {
        // Given the data providers
        characters.character = Character(APICharactersResponseModel.Data.Result(id: 0, name: "", description: "", thumbnail: nil, comics: nil))
        container.mockCharactersRepository = characters
        container.mockFavouritesRepository = favourites
        container.mockImageLoader = imageLoader
        
        // When the make home method is executed
        let characterDetailViewController = sut.makeCharacterDetail(characterID: 1)
        
        // Then the view controller is created
        XCTAssertTrue(characterDetailViewController.view != nil)
    }
}
