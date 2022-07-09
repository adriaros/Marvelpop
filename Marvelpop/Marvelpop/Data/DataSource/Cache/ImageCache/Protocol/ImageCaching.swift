//
//  ImageCaching.swift
//  Marvelpop
//
//  Created by Adrià Ros on 7/7/22.
//

import UIKit

protocol ImageCaching {
    func set(image: UIImage, url: URL)
    func image(url: URL) -> UIImage?
    func remove(image url: URL)
    func removeCache()
}
