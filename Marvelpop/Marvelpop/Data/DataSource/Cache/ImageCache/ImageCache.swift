//
//  ImageCache.swift
//  Marvelpop
//
//  Created by Adrià Ros on 7/7/22.
//

import UIKit

final class ImageCache: ImageCacheProtocol {
    
    private let cachedImages = NSCache<NSURL, UIImage>()
    
    func set(image: UIImage, url: URL) {
        cachedImages.setObject(image, forKey: NSURL(fileURLWithPath: url.absoluteString))
    }
    
    func image(url: URL) -> UIImage? {
        cachedImages.object(forKey: NSURL(fileURLWithPath: url.absoluteString))
    }
    
    func remove(image url: URL) {
        cachedImages.removeObject(forKey: NSURL(fileURLWithPath: url.absoluteString))
    }
    
    func removeCache() {
        cachedImages.removeAllObjects()
    }
}
