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
        // Given a character
        let character = Character(APICharactersResponseModel.Data.Result(id: 1234, name: "Hulk", description: "A Green guy", thumbnail: nil))
        
        // When the cell is configured
        sut.configure(character: character)
        
        // Then the cell is configured
        XCTAssertEqual(sut.nameLabel.style, .title(character.displayName, .black, .white, .left, true, 0))
        XCTAssertEqual(sut.descriptionLabel.style, .paragraph(character.displayDescription, .black.withAlphaComponent(0.8), .white.withAlphaComponent(0.8), .left, true, 0))
    }
}
