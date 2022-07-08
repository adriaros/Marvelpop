//
//  CharacterDetailDataTableViewCellTest.swift
//  MarvelpopUnitTests
//
//  Created by Adrià Ros on 7/7/22.
//

import XCTest
@testable import Marvelpop

class CharacterDetailDataTableViewCellTest: XCTestCase {
    
    var sut: CharacterDetailDataTableViewCell!

    override func setUpWithError() throws {
        sut = Bundle(for: CharacterDetailDataTableViewCell.self).loadNibNamed(CharacterDetailDataTableViewCell.cellType, owner: nil)?.first as? CharacterDetailDataTableViewCell
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_configure() throws {
        // Given a title and text
        let title = "Title"
        let text = "Text"
        
        // When the cell is configured
        sut.configure(title: title, text: text)
        
        // Then the cell is configured
        XCTAssertEqual(sut.titleLabel.style, .title(title, .black, .white, .left, true, 0))
        XCTAssertEqual(sut.descriptionLabel.style, .paragraph(text, .black.withAlphaComponent(0.8), .white.withAlphaComponent(0.8), .left, true, 0))
    }
}
