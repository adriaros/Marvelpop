//
//  HTTPMethod.swift
//  Marvelpop
//
//  Created by Adrià Ros on 6/7/22.
//

import Foundation

enum HTTPMethod: String, Equatable {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}
