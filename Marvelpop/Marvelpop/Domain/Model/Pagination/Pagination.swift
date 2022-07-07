//
//  Pagination.swift
//  Marvelpop
//
//  Created by Adrià Ros on 7/7/22.
//

import Foundation

struct Pagination: Equatable {
    let offset: Int?
    let total: Int?
    let count: Int?
    let limit: Int?
}
