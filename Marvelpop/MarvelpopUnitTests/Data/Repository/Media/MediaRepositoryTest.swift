//
//  MediaRepositoryTest.swift
//  MarvelpopUnitTests
//
//  Created by Adrià Ros on 7/7/22.
//

import XCTest
import UIKit
@testable import Marvelpop

class MediaRepositoryTest: XCTestCase {
    
    var sut: MediaRepository!
    var api: FakeMarvelAPI!
    var cache: MockImageCache!

    override func setUpWithError() throws {
        api = FakeMarvelAPI()
        cache = MockImageCache()
        sut = MediaRepository(api: api, cache: cache)
    }

    override func tearDownWithError() throws {
        api = nil
        sut = nil
    }

    func test_downaloadImageFrom() throws {
        // Given the expectation
        weak var expectation = self.expectation(description: #function)
        var expectedImage: UIImage?
        
        // Given a image
        let image = UIImage()
        api.image = image
        
        // When downloading image from URL
        sut.download(imageFrom: URL(string: "image/path")) { data in
            expectedImage = data
            expectation?.fulfill()
            expectation = nil
        }
        
        // Then the result is the expected image
        waitForExpectations(timeout: 1, handler: nil)
        XCTAssertEqual(expectedImage, image)
    }
    
    func test_store() throws {
        // Given a image to store
        let image = UIImage()
        let url = URL(string: "image/path")
        
        // When image is cached
        sut.store(image: image, url: url)
        
        // Then the image is cached
        XCTAssertEqual(cache.imageSet, image)
        XCTAssertEqual(cache.imageSetUrl, url)
    }
    
    func test_load() throws {
        // Given a cached image
        let image = UIImage()
        cache.cachedImage = image
        
        // When image is cached
        let cachedImage = sut.load(image: URL(string: "image/path"))
        
        // Then the image is cached
        XCTAssertEqual(cachedImage, image)
    }
}
