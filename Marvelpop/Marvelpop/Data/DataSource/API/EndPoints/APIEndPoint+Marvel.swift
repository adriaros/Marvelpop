//
//  APIEndPoint+Marvel.swift
//  Marvelpop
//
//  Created by Adrià Ros on 6/7/22.
//

import Foundation

extension APIEndPoint {
    
    internal enum Marvel {
        static let Scheme = "https://"
        static let Host = "gateway.marvel.com"
        static let Ts = "1"
        static let Hash = (Ts + APIKeys.Marvel.Secret + APIKeys.Marvel.Key).MD5
        
        internal enum Get {
            static let characters = "/v1/public/characters"
            static let character = "/v1/public/characters/%@"
        }
    }
}
