//
//  MockImageCache.swift
//  MarvelpopUnitTests
//
//  Created by Adrià Ros on 7/7/22.
//

import UIKit
@testable import Marvelpop

final class MockImageCache: ImageCaching {
    
    var imageSet: UIImage?
    var imageSetUrl: URL?
    var cachedImage: UIImage?
    
    func set(image: UIImage, url: URL) {
        imageSet = image
        imageSetUrl = url
    }
    
    func image(url: URL) -> UIImage? {
        cachedImage
    }
    
    func remove(image url: URL) {
        
    }
    
    func removeCache() {
        
    }
}
