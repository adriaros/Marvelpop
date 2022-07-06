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

    override func setUpWithError() throws {
        sut = HomeCoordinator()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_start() throws {
        // When start is executed
        sut.start()
        
        // Then the coordinator is started correctly
        XCTAssertTrue(sut.navigationController?.viewControllers.first is HomeViewController)
    }
}
