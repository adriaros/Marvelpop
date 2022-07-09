//
//  MediaRepository.swift
//  Marvelpop
//
//  Created by Adrià Ros on 7/7/22.
//

import UIKit

final class MediaRepository: MediaRepositoring {
    
    private let api: MarvelAPIProtocol
    private let cache: ImageCaching
    
    init(api: MarvelAPIProtocol, cache: ImageCaching) {
        self.api = api
        self.cache = cache
    }
    
    func download(imageFrom url: URL?, completion: @escaping (_ data: UIImage?) -> Void) {
        api.download(imageFrom: url) { data in
            completion(data)
        }
    }
    
    func store(image: UIImage?, url: URL?) {
        guard let image = image, let url = url else {
            return
        }
        
        cache.set(image: image, url: url)
    }
    
    func load(image url: URL?) -> UIImage? {
        guard let url = url else {
            return nil
        }
        
        return cache.image(url: url)
    }
}
