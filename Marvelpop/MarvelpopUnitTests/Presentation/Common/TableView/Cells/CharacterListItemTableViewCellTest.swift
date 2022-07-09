//
//  CharacterListItemTableViewCellTest.swift
//  MarvelpopUnitTests
//
//  Created by Adrià Ros on 7/7/22.
//

import XCTest
@testable import Marvelpop

final class CharacterListItemTableViewCellTest: XCTestCase {
    
    private var sut: CharacterListItemTableViewCell!
    private var imageLoaderUseCase: MockImageLoaderUseCase!

    override func setUpWithError() throws {
        imageLoaderUseCase = MockImageLoaderUseCase()
        sut = Bundle(for: CharacterListItemTableViewCell.self).loadNibNamed(CharacterListItemTableViewCell.cellType, owner: nil)?.first as? CharacterListItemTableViewCell
        sut.layoutSubviews()
    }

    override func tearDownWithError() throws {
        imageLoaderUseCase = nil
        sut = nil
    }

    func test_configure() throws {
        // Given a title, description and an image
        let title = "Title"
        let description = "Description"
        imageLoaderUseCase.image = ImageAssets.Home.logo.image
        
        // When the cell is configured
        sut.imageLoader = imageLoaderUseCase
        sut.configure(title: title, description: description, image: URL(string: "/image/path"))
        
        // Then
        XCTAssertEqual(sut.selectionStyle, .none)
        XCTAssertEqual(sut.backgroundColor, .clear)
        XCTAssertEqual(sut.containerShape.style, .rounded)
        XCTAssertEqual(sut.containerImageView.contentMode, .scaleAspectFit)
        XCTAssertEqual(sut.containerImageView.image, ImageAssets.Home.logo.image)
        XCTAssertEqual(sut.titleLabel.style, .title(title, .left, false, 1))
        XCTAssertEqual(sut.descriptionLabel.style, .paragraph(description, .left, false, 1))
    }
}
