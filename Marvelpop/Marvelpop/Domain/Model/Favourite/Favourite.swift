//
//  Favourite.swift
//  Marvelpop
//
//  Created by Adrià Ros on 7/7/22.
//

import Foundation

struct Favourite: Equatable {
    
    let id: Int
    let name: String
    let text: String
    let thumbnailPath: String
    let thumbnailExtension: String
    
    var displayName: String {
        name.isEmpty ? "N/A" : name.capitalized
    }
    
    var displayDescription: String {
        text.isEmpty ? "N/A" : text
    }
    
    var listImageURL: URL? {
        URL(string: thumbnailPath + ImageAssets.Home.imageSize + thumbnailExtension)
    }
    
    init(_ entity: FavouriteEntity) {
        id = Int(entity.id)
        name = entity.name ?? ""
        text = entity.text ?? ""
        thumbnailPath = entity.thumbnailPath ?? ""
        thumbnailExtension = entity.thumbnailExtension ?? "jpg"
    }
    
    init(_ character: Character) {
        id = character.id
        name = character.name
        text = character.text
        thumbnailPath = character.thumbnailPath
        thumbnailExtension = character.thumbnailExtension
    }
}
