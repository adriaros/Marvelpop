//
//  APIKeys+Marvel.swift
//  Marvelpop
//
//  Created by Adrià Ros on 6/7/22.
//

import Foundation

extension APIKeys {
    
    internal enum Marvel {
        static let Key = Bundle.main.infoDictionary?["MARVEL_PUBLIC_KEY"] as! String
        static let Secret = Bundle.main.infoDictionary?["MARVEL_PRIVATE_KEY"] as! String
    }
}
