//
//  DependencyFactory.swift
//  Marvelpop
//
//  Created by Adrià Ros on 6/7/22.
//

import Foundation

protocol DependencyFactory {
    var marvelAPI: APIProvider { get }
    var charactersRepository: CharactersRepositoring { get }
    var mediaRepository: MediaRepositoring { get }
    var favouritesRepository: FavouritesRepositoring { get }
    var imageLoaderUseCase: ImageLoaderUseCaseProtocol { get }
}
