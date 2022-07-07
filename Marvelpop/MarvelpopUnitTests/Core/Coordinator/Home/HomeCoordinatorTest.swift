//
//  HomeCoordinatorTest.swift
//  MarvelpopUnitTests
//
//  Created by Adrià Ros on 6/7/22.
//

import XCTest
@testable import Marvelpop

class HomeCoordinatorTest: XCTestCase {
    
    var sut: HomeCoordinator!
    var viewControllerContainer: FakeViewControllerContainer!

    override func setUpWithError() throws {
        viewControllerContainer = FakeViewControllerContainer()
        sut = HomeCoordinator(container: viewControllerContainer)
    }

    override func tearDownWithError() throws {
        viewControllerContainer = nil
        sut = nil
    }

    func test_start() throws {
        // Given a home view controller
        let homeViewController = HomeViewController()
        viewControllerContainer.fakeHome = homeViewController
        
        // When start is executed
        sut.start()
        
        // Then the coordinator is started correctly
        XCTAssertEqual(sut.navigationController?.viewControllers.first, homeViewController)
    }
    
    func test_pushToCharacterDetail() throws {
        // Given a home view controller
        let homeViewController = HomeViewController()
        viewControllerContainer.fakeHome = homeViewController
        
        // Given a character detail view controller
        let characterDetailViewController = CharacterDetailViewController()
        viewControllerContainer.fakeCharacterDetail = characterDetailViewController
        
        // Given a spy navigation controller
        let spy = SpyNavigationController(rootViewController: homeViewController)
        sut.navigationController = spy
        
        // When the push to character detail is executed
        sut.pushToCharacterDetailWith(id: 0)
        
        // Then the pushed view controller is the character detail
        XCTAssertTrue((spy.pushedViewController as? CharacterDetailViewController) != nil)
    }
}
