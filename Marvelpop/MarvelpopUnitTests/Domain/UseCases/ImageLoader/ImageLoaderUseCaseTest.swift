//
//  ImageLoaderUseCaseTest.swift
//  MarvelpopUnitTests
//
//  Created by Adrià Ros on 7/7/22.
//

import XCTest
import UIKit
@testable import Marvelpop

final class ImageLoaderUseCaseTest: XCTestCase {
    
    private var sut: ImageLoaderUseCase!
    private var imageRepository: MockMediaRepository!

    override func setUpWithError() throws {
        imageRepository = MockMediaRepository()
        sut = ImageLoaderUseCase(provider: imageRepository)
    }

    override func tearDownWithError() throws {
        sut = nil
        imageRepository = nil
    }
    
    func test_loadImageFromCache() throws {
        // Given a expectation
        weak var expectation = self.expectation(description: #function)
        var result: UIImage?
        
        // Given an image stored in cache
        let image = UIImage()
        imageRepository.imageToLoad = image
        
        // When the method is executed
        sut.load(imageFrom: URL(string: "/image/path")) { data in
            result = data
            expectation?.fulfill()
            expectation = nil
        }
        
        // Then the image is loaded from the cache
        waitForExpectations(timeout: 1, handler: nil)
        XCTAssertEqual(result, image)
    }
    
    func test_loadImageFromCloud() throws {
        // Given a expectation
        weak var expectation = self.expectation(description: #function)
        var result: UIImage?
        
        // Given an image to download
        let image = UIImage()
        imageRepository.imageDownloaded = image
        
        // When the method is executed
        sut.load(imageFrom: URL(string: "image/path")) { data in
            result = data
            expectation?.fulfill()
            expectation = nil
        }
        
        // Then the image is downloaded and stored in cache
        waitForExpectations(timeout: 1, handler: nil)
        XCTAssertEqual(result, image)
        XCTAssertEqual(imageRepository.imageToStore, image)
    }
}
