//
//  CharacterDetailImageTableViewCellTest.swift
//  MarvelpopUnitTests
//
//  Created by Adrià Ros on 7/7/22.
//

import XCTest
@testable import Marvelpop

class CharacterDetailImageTableViewCellTest: XCTestCase {

    var sut: CharacterDetailImageTableViewCell!
    var imageLoader: MockImageLoaderUseCase!
    var delegate: CharacterDetailImageTableViewCellDelegateTestableDelegate!
    
    override func setUpWithError() throws {
        delegate = CharacterDetailImageTableViewCellDelegateTestableDelegate()
        sut = Bundle(for: CharacterDetailImageTableViewCell.self).loadNibNamed(CharacterDetailImageTableViewCell.cellType, owner: nil)?.first as? CharacterDetailImageTableViewCell
        imageLoader = MockImageLoaderUseCase()
        sut.imageLoader = imageLoader
        sut.layoutSubviews()
    }

    override func tearDownWithError() throws {
        delegate = nil
        imageLoader = nil
        sut = nil
    }

    func test_configure() throws {
        // Given a fake URL
        let url = URL(string: "/image/download/path")
        
        // Given a mock image
        imageLoader.image = ImageAssets.CharacterDetail.logo.image
        
        // When the cell is configured
        sut.configure(image: url, favourite: false)
        sut.configure(background: url)
        
        // Then the cell is configured
        XCTAssertEqual(sut.selectionStyle, .none)
        XCTAssertEqual(sut.backgroundImageView.contentMode, .scaleAspectFill)
        XCTAssertEqual(sut.characterImageView.contentMode, .scaleAspectFit)
        XCTAssertEqual(sut.lineView.backgroundColor, .separator)
        XCTAssertEqual(sut.characterImageView.image, ImageAssets.CharacterDetail.logo.image)
        XCTAssertEqual(sut.backgroundImageView.image, ImageAssets.CharacterDetail.logo.image)
        XCTAssertEqual(sut.favouriteButton.image(for: .normal), UIImage(systemName: "suit.heart"))
    }
    
    func test_onFavourite() throws {
        // Given a fake URL
        let url = URL(string: "/image/download/path")
        
        // Given a mock image
        imageLoader.image = ImageAssets.CharacterDetail.logo.image
        
        // Give a configured cell
        sut.delegate = delegate
        sut.configure(image: url, favourite: false)
        
        // When the favourite button is tapped
        sut.onFavourite(sut.favouriteButton!)
        
        // Then the button has changed to filled shape
        XCTAssertEqual(sut.favouriteButton.image(for: .normal), UIImage(systemName: "suit.heart.fill"))
        
        // Then the delegate is called
        XCTAssertTrue(delegate.onFavouriteCalled)
    }
}

class CharacterDetailImageTableViewCellDelegateTestableDelegate: CharacterDetailImageTableViewCellDelegate {
    
    var onFavouriteCalled = false
    
    func onFavourite() {
        onFavouriteCalled = true
    }
}
