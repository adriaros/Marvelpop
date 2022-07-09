//
//  APIProvider.swift
//  Marvelpop
//
//  Created by Adrià Ros on 6/7/22.
//

import UIKit

protocol APIProvider {
    func process(request: NetworkRequest, _ completion: @escaping (HTTPStatusCode, Data?) -> Void)
    func download(imageFrom url: URL?, completion: @escaping (_ data: UIImage?) -> Void)
}
