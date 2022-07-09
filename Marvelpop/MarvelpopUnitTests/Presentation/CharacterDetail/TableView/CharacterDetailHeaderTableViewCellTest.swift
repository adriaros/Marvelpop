//
//  CharacterDetailHeaderTableViewCellTest.swift
//  MarvelpopUnitTests
//
//  Created by Adrià Ros on 7/7/22.
//

import XCTest
@testable import Marvelpop

class CharacterDetailHeaderTableViewCellTest: XCTestCase {

    private var sut: CharacterDetailHeaderTableViewCell!
    private var imageLoader: MockImageLoaderUseCase!
    
    override func setUpWithError() throws {
        sut = Bundle(for: CharacterDetailHeaderTableViewCell.self).loadNibNamed(CharacterDetailHeaderTableViewCell.cellType, owner: nil)?.first as? CharacterDetailHeaderTableViewCell
        imageLoader = MockImageLoaderUseCase()
        sut.imageLoader = imageLoader
        sut.layoutSubviews()
    }

    override func tearDownWithError() throws {
        imageLoader = nil
        sut = nil
    }

    func test_configure() throws {
        // Given a fake URL
        let url = URL(string: "/image/download/path")
        
        // Given a mock image
        imageLoader.image = ImageAssets.CharacterDetail.logo.image
        
        // When the cell is configured
        sut.configure(character: "Hulk", imageUrl: url)
        sut.configure(background: url)
        
        // Then the cell is configured
        XCTAssertEqual(sut.selectionStyle, .none)
        XCTAssertEqual(sut.backgroundImageView.contentMode, .scaleAspectFill)
        XCTAssertEqual(sut.characterImageView.contentMode, .scaleAspectFit)
        XCTAssertEqual(sut.lineView.backgroundColor, .separator)
        XCTAssertEqual(sut.nameLabel.style, .title("Hulk", .left, true, 0))
        XCTAssertEqual(sut.characterImageView.image, ImageAssets.CharacterDetail.logo.image)
        XCTAssertEqual(sut.backgroundImageView.image, ImageAssets.CharacterDetail.logo.image)
    }
}
