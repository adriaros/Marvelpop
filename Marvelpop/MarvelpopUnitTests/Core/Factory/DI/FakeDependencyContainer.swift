//
//  FakeDependencyContainer.swift
//  MarvelpopUnitTests
//
//  Created by Adrià Ros on 6/7/22.
//

import Foundation
@testable import Marvelpop

final class FakeDependencyContainer: DependencyFactory {
    
    var mockMarvelApi: MarvelAPIProtocol!
    var mockCharactersRepository: CharactersRepositoring!
    var mockMediaRepository: MediaRepositoring!
    var mockImageLoaderUseCase: ImageLoaderUseCaseProtocol!
    var mockFavouritesRepository: FavouritesRepositoring!
   
    var marvelAPI: MarvelAPIProtocol {
        mockMarvelApi
    }
    
    var charactersRepository: CharactersRepositoring {
        mockCharactersRepository
    }
    
    var mediaRepository: MediaRepositoring {
        mockMediaRepository
    }
    
    var favouritesRepository: FavouritesRepositoring {
        mockFavouritesRepository
    }
    
    var imageLoaderUseCase: ImageLoaderUseCaseProtocol {
        mockImageLoaderUseCase
    }
}
