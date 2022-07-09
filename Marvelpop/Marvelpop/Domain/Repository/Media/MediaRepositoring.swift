//
//  MediaRepositoring.swift
//  Marvelpop
//
//  Created by Adrià Ros on 7/7/22.
//

import UIKit

protocol MediaRepositoring {
    func download(imageFrom url: URL?, completion: @escaping (_ data: UIImage?) -> Void)
    func store(image: UIImage?, url: URL?)
    func load(image url: URL?) -> UIImage?
}
