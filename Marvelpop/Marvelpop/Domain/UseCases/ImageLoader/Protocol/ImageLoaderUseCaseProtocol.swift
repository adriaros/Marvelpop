//
//  ImageLoaderUseCaseProtocol.swift
//  Marvelpop
//
//  Created by Adrià Ros on 7/7/22.
//

import UIKit

protocol ImageLoaderUseCaseProtocol {
    func load(imageFrom url: URL?, completion: @escaping (_ data: UIImage?) -> Void)
}
