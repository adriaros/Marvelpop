//
//  CharacterDetailDataTableViewCellTest.swift
//  MarvelpopUnitTests
//
//  Created by Adrià Ros on 7/7/22.
//

import XCTest
@testable import Marvelpop

final class CharacterDetailDataTableViewCellTest: XCTestCase {
    
    private var sut: CharacterDetailDataTableViewCell!

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
        XCTAssertEqual(sut.titleLabel.style, .title(title, .left, true, 1))
        XCTAssertEqual(sut.descriptionLabel.style, .paragraph(text, .left, true, 0))
    }
}
