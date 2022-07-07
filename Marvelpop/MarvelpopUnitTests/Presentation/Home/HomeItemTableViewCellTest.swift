//
//  HomeItemTableViewCellTest.swift
//  MarvelpopUnitTests
//
//  Created by Adrià Ros on 7/7/22.
//

import XCTest
@testable import Marvelpop

class HomeItemTableViewCellTest: XCTestCase {
    
    var sut: HomeItemTableViewCell!
    var imageLoaderUseCase: MockImageLoaderUseCase!

    override func setUpWithError() throws {
        imageLoaderUseCase = MockImageLoaderUseCase()
        sut = Bundle(for: HomeItemTableViewCell.self).loadNibNamed(HomeItemTableViewCell.cellType, owner: nil)?.first as? HomeItemTableViewCell
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
        XCTAssertEqual(sut.titleLabel.style, .title(title, .black, .white, .left, true, 1))
        XCTAssertEqual(sut.descriptionLabel.style, .paragraph(description, .black.withAlphaComponent(0.8), .white.withAlphaComponent(0.8), .left, false, 2))
    }
}
