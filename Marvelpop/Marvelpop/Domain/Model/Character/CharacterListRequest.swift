//
//  CharacterListRequest.swift
//  Marvelpop
//
//  Created by Adrià Ros on 7/7/22.
//

import Foundation

struct CharacterListRequest {
    var limit: Int = 20
    var offset: Int = 0
    
    var limitQuery: QueryItem {
        QueryItem(name: "limit", value: "\(limit)")
    }
    
    var offsetQuery: QueryItem {
        QueryItem(name: "offset", value: "\(offset)")
    }
}
