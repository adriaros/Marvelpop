//
//  Comic.swift
//  Marvelpop
//
//  Created by Adrià Ros on 8/7/22.
//

import Foundation

struct Comic: Equatable {
    
    let name: String
    
    var displayName: String {
        name.lowercased().capitalized
    }
    
    init(_ data: APICharactersResponseModel.Data.Result.Comics.ComicsItem) {
        name = data.name
    }
}
