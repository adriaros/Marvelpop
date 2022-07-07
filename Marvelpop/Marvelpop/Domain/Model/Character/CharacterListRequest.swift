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
    var nameStartsWith: String?
    
    var queryItems: [QueryItem] {
        var items = [QueryItem(name: "limit", value: "\(limit)"), QueryItem(name: "offset", value: "\(offset)")]
        
        if let nameStartsWith = nameStartsWith, !nameStartsWith.isEmpty {
            items.append(QueryItem(name: "nameStartsWith", value: nameStartsWith))
        }
        
        return items
    }
}
