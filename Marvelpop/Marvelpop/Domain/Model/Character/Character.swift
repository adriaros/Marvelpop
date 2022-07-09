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
    var comics: [Comic]
    
    var displayName: String {
        name.isEmpty ? "N/A" : name.capitalized
    }
    
    var displayDescription: String {
        text.isEmpty || text.isBlank ? "N/A" : text
    }
    
    var listImageURL: URL? {
        URL(string: thumbnailPath + ImageAssets.Home.imageSize + thumbnailExtension)
    }
    
    var portraitImageURL: URL? {
        URL(string: thumbnailPath + ImageAssets.CharacterDetail.imagePortraitSize + thumbnailExtension)
    }
    
    var landscapeImageURL: URL? {
        URL(string: thumbnailPath + ImageAssets.CharacterDetail.imageLandscapeSize + thumbnailExtension)
    }
    
    init(_ data: APICharactersResponseModel.Data.Result) {
        id = data.id ?? 0
        name = data.name ?? ""
        text = data.description ?? ""
        thumbnailPath = data.thumbnail?.path ?? ""
        thumbnailExtension = data.thumbnail?.ext ?? "jpg"
        comics = data.comics?.items.compactMap { Comic($0) } ?? []
    }
}
