//
//  MainCoordinatorTest.swift
//  MarvelpopUnitTests
//
//  Created by Adrià Ros on 6/7/22.
//

import XCTest
@testable import Marvelpop

class MainCoordinatorTest: XCTestCase {
    
    var sut: MainCoordinator!

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_start() throws {
        // Given the coordinator
        sut = MainCoordinator(window: nil)
        
        // When the coordinator is started
        sut.start()
        
        // Then the tabBar controller contains two view controllers
        XCTAssertEqual(sut.rootViewController.viewControllers?[0].tabBarItem.title, "tabbar_home".localized)
        XCTAssertEqual(sut.rootViewController.viewControllers?[0].tabBarItem.tag, 0)
        XCTAssertEqual(sut.rootViewController.viewControllers?[0].tabBarItem.image, UIImage(systemName: "heart.fill"))
        
        XCTAssertEqual(sut.rootViewController.viewControllers?[1].tabBarItem.title, "tabbar_favourites".localized)
        XCTAssertEqual(sut.rootViewController.viewControllers?[1].tabBarItem.tag, 1)
        XCTAssertEqual(sut.rootViewController.viewControllers?[1].tabBarItem.image, UIImage(systemName: "heart.fill"))
    }
}
