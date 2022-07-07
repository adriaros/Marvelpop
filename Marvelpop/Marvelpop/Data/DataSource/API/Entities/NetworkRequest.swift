//
//  NetworkRequest.swift
//  Marvelpop
//
//  Created by Adrià Ros on 6/7/22.
//

import Foundation

struct NetworkRequest {
    var path: String = ""
    var method: HTTPMethod = .get
    var queryItems: [QueryItem]?
}
