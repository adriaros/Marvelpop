//
//  ImageLoaderUseCase.swift
//  Marvelpop
//
//  Created by Adrià Ros on 7/7/22.
//

import UIKit

class ImageLoaderUseCase: ImageLoaderUseCaseProtocol {
    
    private let provider: MediaRepositoryProtocol
    
    init(provider: MediaRepositoryProtocol) {
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
