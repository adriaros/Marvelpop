//
//  MainCoordinatorTest.swift
//  MarvelpopUnitTests
//
//  Created by Adrià Ros on 6/7/22.
//

import XCTest
@testable import Marvelpop

class MainCoordinatorTest: XCTestCase {
    
    var viewControllerContainer: FakeViewControllerContainer!
    var sut: MainCoordinator!

    override func setUpWithError() throws {
        viewControllerContainer = FakeViewControllerContainer()
    }

    override func tearDownWithError() throws {
        viewControllerContainer = nil
        sut = nil
    }

    func test_start() throws {
        // Given the tab bar controller
        viewControllerContainer.fakeTabBar = TabBarController()
        viewControllerContainer.fakeHome = HomeViewController()
        viewControllerContainer.fakeFavourites = FavouritesViewController()
        
        // Given the coordinator
        sut = MainCoordinator(window: nil, container: viewControllerContainer)
        
        // When the coordinator is started
        sut.start()
        
        // Then the tabBar controller contains two view controllers
        XCTAssertEqual(sut.rootViewController.viewControllers?[0].tabBarItem.title, "tabbar_home".localized)
        XCTAssertEqual(sut.rootViewController.viewControllers?[0].tabBarItem.tag, 0)
        XCTAssertEqual(sut.rootViewController.viewControllers?[0].tabBarItem.image, ImageAssets.TabBar.home.image)
        
        XCTAssertEqual(sut.rootViewController.viewControllers?[1].tabBarItem.title, "tabbar_favourites".localized)
        XCTAssertEqual(sut.rootViewController.viewControllers?[1].tabBarItem.tag, 1)
        XCTAssertEqual(sut.rootViewController.viewControllers?[1].tabBarItem.image, ImageAssets.TabBar.favourites.image)
    }
}
