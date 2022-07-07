//
//  Character.swift
//  Marvelpop
//
//  Created by Adrià Ros on 7/7/22.
//

import Foundation

struct Character: Equatable {
    
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
    
    var detailImageURL: URL? {
        URL(string: thumbnailPath + ImageAssets.CharacterDetail.imageSize + thumbnailExtension)
    }
    
    init(_ data: APICharactersResponseModel.Data.Result) {
        id = data.id ?? 0
        name = data.name ?? ""
        text = data.description ?? ""
        thumbnailPath = data.thumbnail?.path ?? ""
        thumbnailExtension = data.thumbnail?.ext ?? "jpg"
    }
}
