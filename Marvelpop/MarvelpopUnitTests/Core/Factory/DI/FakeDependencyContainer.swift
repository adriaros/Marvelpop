//
//  FakeDependencyContainer.swift
//  MarvelpopUnitTests
//
//  Created by Adrià Ros on 6/7/22.
//

import Foundation
@testable import Marvelpop

class FakeDependencyContainer: DependencyFactory {
    
    var mockMarvelApi: MarvelAPIProtocol!
    var mockCharactersRepository: CharactersRepositoryProtocol!
    var mockMediaRepository: MediaRepositoryProtocol!
    var mockImageLoaderUseCase: ImageLoaderUseCaseProtocol!
    var mockFavouritesRepository: FavouritesRepositoryProtocol!
   
    var marvelAPI: MarvelAPIProtocol {
        mockMarvelApi
    }
    
    var charactersRepository: CharactersRepositoryProtocol {
        mockCharactersRepository
    }
    
    var mediaRepository: MediaRepositoryProtocol {
        mockMediaRepository
    }
    
    var favouritesRepository: FavouritesRepositoryProtocol {
        mockFavouritesRepository
    }
    
    var imageLoaderUseCase: ImageLoaderUseCaseProtocol {
        mockImageLoaderUseCase
    }
}
