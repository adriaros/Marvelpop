//
//  DependencyFactory.swift
//  Marvelpop
//
//  Created by Adrià Ros on 6/7/22.
//

import Foundation

protocol DependencyFactory {
    var marvelAPI: MarvelAPIProtocol { get }
    var charactersRepository: CharactersRepositoryProtocol { get }
    var mediaRepository: MediaRepositoryProtocol { get }
    var favouritesRepository: FavouritesRepositoryProtocol { get }
    var imageLoaderUseCase: ImageLoaderUseCaseProtocol { get }
}
