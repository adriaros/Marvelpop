//
//  CharactersRepositoryTest.swift
//  MarvelpopUnitTests
//
//  Created by Adrià Ros on 7/7/22.
//

import XCTest
@testable import Marvelpop

class CharactersRepositoryTest: XCTestCase {
    
    private var sut: CharactersRepository!
    private var api: FakeMarvelAPI!

    override func setUpWithError() throws {
        api = FakeMarvelAPI()
        sut = CharactersRepository(api: api)
    }

    override func tearDownWithError() throws {
        api = nil
        sut = nil
    }

    func test_getCharacterList_success() throws {
        // Given the expectation
        weak var expectation = self.expectation(description: #function)
        var expectedData: [Character]?
        var expectedPagination: Pagination?
        
        // Given the expected response
        api.jsonFile = "JSON_GetCharacterList"
        api.code = .success
        
        // When the request is executed
        sut.getCharacterList(request: CharacterListRequest()) { data, pagination, _ in
            expectedData = data
            expectedPagination = pagination
            expectation?.fulfill()
            expectation = nil
        }
        
        // Then the result is decoded as expected
        waitForExpectations(timeout: 1, handler: nil)
        XCTAssertEqual(expectedData?.count, 2)
        XCTAssertEqual(expectedData?[0].id, 1011334)
        XCTAssertEqual(expectedData?[0].name, "3-D Man")
        XCTAssertEqual(expectedData?[1].id, 1017100)
        XCTAssertEqual(expectedData?[1].name, "A-Bomb (HAS)")
        XCTAssertEqual(expectedPagination?.total, 1562)
    }
    
    func test_getCharacterList_error() throws {
        // Given the expectation
        weak var expectation = self.expectation(description: #function)
        var expectedData: [Character]?
        var expectedPagination: Pagination?
        var expectedError: ErrorType?
        
        // Given the expected response
        api.code = .serverError
        
        // When the request is executed
        sut.getCharacterList(request: CharacterListRequest()) { data, pagination, err in
            expectedData = data
            expectedPagination = pagination
            expectedError = err
            expectation?.fulfill()
            expectation = nil
        }
        
        // Then the result is decoded as expected
        waitForExpectations(timeout: 1, handler: nil)
        XCTAssertEqual(expectedData?.count, 0)
        XCTAssertEqual(expectedPagination, nil)
        XCTAssertEqual(expectedError, .api(.serverError))
    }
    
    func test_getCharacter() throws {
        // Given the expectation
        weak var expectation = self.expectation(description: #function)
        var expectedData: Character?
        
        // Given the expected response
        api.jsonFile = "JSON_GetCharacter"
        api.code = .success
        
        // When the request is executed
        sut.getCharacterWith(id: 1011334) { data, _  in
            expectedData = data
            expectation?.fulfill()
            expectation = nil
        }
        
        // Then the result is decoded as expected
        waitForExpectations(timeout: 1, handler: nil)
        XCTAssertEqual(expectedData?.id, 1011334)
        XCTAssertEqual(expectedData?.name, "3-D Man")
    }
    
    func test_getCharacter_error() throws {
        // Given the expectation
        weak var expectation = self.expectation(description: #function)
        var expectedData: Character?
        var expectedError: ErrorType?
        
        // Given the expected response
        api.jsonFile = "JSON_GetCharacter"
        api.code = .serverError
        
        // When the request is executed
        sut.getCharacterWith(id: 1011334) { data, error in
            expectedError = error
            expectedData = data
            expectation?.fulfill()
            expectation = nil
        }
        
        // Then the result is decoded as expected
        waitForExpectations(timeout: 1, handler: nil)
        XCTAssertEqual(expectedData, nil)
        XCTAssertEqual(expectedError, .api(.serverError))
    }
}
