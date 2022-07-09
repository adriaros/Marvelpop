//
//  DSTextFieldTest.swift
//  MarvelpopUnitTests
//
//  Created by Adrià Ros on 7/7/22.
//

import XCTest
@testable import Marvelpop

final class DSTextFieldTest: XCTestCase {
    
    private var sut: DSTextField!

    override func setUpWithError() throws {
        sut = DSTextField(frame: CGRect(x: 0, y: 0, width: 50, height: 40))
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_basic() throws {
        // Given the style
        let style: DSTextFieldStyle = .basic("placeholder")
        
        // When the style is set
        sut.style = style
        
        // Then
        XCTAssertEqual(sut.style, style)
    }
}
