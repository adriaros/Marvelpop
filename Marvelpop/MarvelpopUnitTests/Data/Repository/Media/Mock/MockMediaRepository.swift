//
//  MockMediaRepository.swift
//  MarvelpopUnitTests
//
//  Created by Adrià Ros on 7/7/22.
//

import UIKit
@testable import Marvelpop

final class MockMediaRepository: MediaRepositoryProtocol {
    
    var imageDownloaded: UIImage?
    var imageToStore: UIImage?
    var imageToLoad: UIImage?
    
    func download(imageFrom url: URL?, completion: @escaping (UIImage?) -> Void) {
        completion(imageDownloaded)
    }
    
    func store(image: UIImage?, url: URL?) {
        imageToStore = image
    }
    
    func load(image url: URL?) -> UIImage? {
        imageToLoad
    }
}
