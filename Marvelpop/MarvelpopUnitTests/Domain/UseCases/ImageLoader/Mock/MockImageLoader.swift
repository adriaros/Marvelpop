//
//  MockImageLoader.swift
//  MarvelpopUnitTests
//
//  Created by Adrià Ros on 7/7/22.
//

import UIKit
@testable import Marvelpop

final class MockImageLoader: ImageLoading {
    
    var image: UIImage?
    
    func load(imageFrom url: URL?, completion: @escaping (UIImage?) -> Void) {
        completion(image)
    }
}
