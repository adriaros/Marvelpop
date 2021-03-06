//
//  ImageLoader.swift
//  Marvelpop
//
//  Created by Adrià Ros on 7/7/22.
//

import UIKit

final class ImageLoader: ImageLoading {
    
    private let provider: MediaRepositoring
    
    init(provider: MediaRepositoring) {
        self.provider = provider
    }
    
    func load(imageFrom url: URL?, completion: @escaping (_ data: UIImage?) -> Void) {
        guard let cachedImage = provider.load(image: url) else {
            provider.download(imageFrom: url) { data in
                self.provider.store(image: data, url: url)
                guaranteeMainThread {
                    completion(data)
                }
            }
            return
        }
        
        guaranteeMainThread {
            completion(cachedImage)
        }
    }
}
