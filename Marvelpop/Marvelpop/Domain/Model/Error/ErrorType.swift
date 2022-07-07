//
//  ErrorType.swift
//  Marvelpop
//
//  Created by Adrià Ros on 7/7/22.
//

import Foundation

enum ErrorType: Error, Equatable {
    case decoding
    case api(HTTPStatusCode)
    case unknown
}
