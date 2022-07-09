//
//  ComicCollectionViewCellTest.swift
//  MarvelpopUnitTests
//
//  Created by Adrià Ros on 8/7/22.
//

import XCTest
@testable import Marvelpop

class ComicCollectionViewCellTest: XCTestCase {
    
    private var sut: ComicCollectionViewCell!
    
    override func setUpWithError() throws {
        sut = Bundle(for: ComicCollectionViewCell.self).loadNibNamed(ComicCollectionViewCell.cellType, owner: nil)?.first as? ComicCollectionViewCell
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_configure() throws {
        // Given a title
        let title = "Title"
        
        // When the cell is configured
        sut.configure(title: title)
        
        // Then the cell is configured
        XCTAssertEqual(sut.nameLabel.style, .subtitle(title, .center, false, 2))
        XCTAssertEqual(sut.itemImageView.image, ImageAssets.CharacterDetail.comic.image)
    }
}
