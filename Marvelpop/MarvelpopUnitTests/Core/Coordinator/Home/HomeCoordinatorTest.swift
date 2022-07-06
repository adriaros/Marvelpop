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
}
