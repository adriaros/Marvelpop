//
//  MarvelAPITest.swift
//  MarvelpopUnitTests
//
//  Created by Adrià Ros on 6/7/22.
//

import XCTest
@testable import Marvelpop

class MarvelAPITest: XCTestCase {
    
    private var sut: MarvelAPI!

    override func setUpWithError() throws {
        var urlSession: URLSession {
            let configuration: URLSessionConfiguration = .ephemeral
            configuration.protocolClasses = [SpyMarvelURLProtocol.self]
            return URLSession(configuration: configuration)
        }
        
        sut = MarvelAPI(session: urlSession)
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_process() throws {
        // Given the expectations
        weak var expectation = self.expectation(description: #function)
        var expectedCode: HTTPStatusCode?
        
        // Given a request
        let request = NetworkRequest(path: "/path/test", method: .get, queryItems: nil)
        
        // When the request is processed
        sut.process(request: request) { code, _ in
            expectedCode = code
            expectation?.fulfill()
            expectation = nil
        }
        
        // Then the SpyMarvelURLProtocol has checked the marvel api parameters and the code is success
        waitForExpectations(timeout: 1, handler: nil)
        XCTAssertEqual(expectedCode, .success)
    }
}
