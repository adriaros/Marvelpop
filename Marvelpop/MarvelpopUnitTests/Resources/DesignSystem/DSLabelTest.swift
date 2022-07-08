//
//  DSLabelTest.swift
//  MarvelpopUnitTests
//
//  Created by Adrià Ros on 7/7/22.
//

import XCTest
@testable import Marvelpop

class DSLabelTest: XCTestCase {
    
    var sut: DSLabel!

    override func setUpWithError() throws {
        sut = DSLabel(frame: CGRect(x: 0, y: 0, width: 50, height: 20))
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_header() throws {
        // Given the style
        let style: DSLabelStyle = .header("header", .black, .white, .left, true, 1)
        
        // When the style is set
        sut.style = style
        
        // Then the style is configured correctly
        XCTAssertEqual(sut.text, "header")
        XCTAssertEqual(sut.font, .noteworthyHeader)
        XCTAssertEqual(sut.textAlignment, .left)
        XCTAssertEqual(sut.numberOfLines, 1)
        XCTAssertTrue(sut.adjustsFontSizeToFitWidth)
    }

    func test_title() throws {
        // Given the style
        let style: DSLabelStyle = .title("title", .black, .white, .left, true, 1)
        
        // When the style is set
        sut.style = style
        
        // Then the style is configured correctly
        XCTAssertEqual(sut.text, "title")
        XCTAssertEqual(sut.font, .noteworthyTitle)
        XCTAssertEqual(sut.textAlignment, .left)
        XCTAssertEqual(sut.numberOfLines, 1)
        XCTAssertTrue(sut.adjustsFontSizeToFitWidth)
    }
    
    func test_paragraph() throws {
        // Given the style
        let style: DSLabelStyle = .paragraph("text", .black, .white, .left, true, 1)
        
        // When the style is set
        sut.style = style
        
        // Then the style is configured correctly
        XCTAssertEqual(sut.text, "text")
        XCTAssertEqual(sut.font, .noteworthyParagraph)
        XCTAssertEqual(sut.textAlignment, .left)
        XCTAssertEqual(sut.numberOfLines, 1)
        XCTAssertTrue(sut.adjustsFontSizeToFitWidth)
    }
    
    func test_subtitle() throws {
        // Given the style
        let style: DSLabelStyle = .subtitle("text", .black, .white, .left, true, 1)
        
        // When the style is set
        sut.style = style
        
        // Then the style is configured correctly
        XCTAssertEqual(sut.text, "text")
        XCTAssertEqual(sut.font, .noteworthySubtitle)
        XCTAssertEqual(sut.textAlignment, .left)
        XCTAssertEqual(sut.numberOfLines, 1)
        XCTAssertTrue(sut.adjustsFontSizeToFitWidth)
    }
}
