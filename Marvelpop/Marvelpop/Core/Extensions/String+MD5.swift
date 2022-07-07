//
//  String+MD5.swift
//  Marvelpop
//
//  Created by Adrià Ros on 6/7/22.
//

import Foundation
import CryptoKit

extension String {
    
    var MD5: String {
        let digest = Insecure.MD5.hash(data: self.data(using: .utf8) ?? Data())
        return digest.map { String(format: "%02hhx", $0) }.joined()
    }
}
