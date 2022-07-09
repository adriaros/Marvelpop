//
//  CharacterDetailComicsTableViewCellTest.swift
//  MarvelpopUnitTests
//
//  Created by Adrià Ros on 8/7/22.
//

import XCTest
@testable import Marvelpop

final class CharacterDetailComicsTableViewCellTest: XCTestCase {
    
    private var sut: CharacterDetailComicsTableViewCell!

    override func setUpWithError() throws {
        sut = Bundle(for: CharacterDetailComicsTableViewCell.self).loadNibNamed(CharacterDetailComicsTableViewCell.cellType, owner: nil)?.first as? CharacterDetailComicsTableViewCell
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_configure() throws {
        // Given a title and one comic
        let comics = [Comic(APICharactersResponseModel.Data.Result.Comics.ComicsItem(resourceURI: "", name: "Hulk 2001"))]
        let title = "Title"
        
        // When the cell is configured
        sut.configure(title: title, comics: comics)
        
        // Then the cell is configured
        XCTAssertEqual(sut.titleLineView.backgroundColor, .separator)
        XCTAssertEqual(sut.titleLabel.style, .title(title, .left, true, 1))
        
        // Then the collection view is configured
        let comicCell = sut.collectionView(sut.collectionView, cellForItemAt: IndexPath(row: 0, section: 0)) as! ComicCollectionViewCell
        XCTAssertEqual(comicCell.nameLabel.text, comics.first?.displayName)
    }
}
