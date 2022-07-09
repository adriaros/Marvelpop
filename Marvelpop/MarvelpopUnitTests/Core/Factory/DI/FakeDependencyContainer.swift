//
//  FakeDependencyContainer.swift
//  MarvelpopUnitTests
//
//  Created by Adrià Ros on 6/7/22.
//

import Foundation
@testable import Marvelpop

final class FakeDependencyContainer: DependencyFactory {
    
    var mockMarvelApi: APIProvider!
    var mockCharactersRepository: CharactersRepositoring!
    var mockMediaRepository: MediaRepositoring!
    var mockImageLoader: ImageLoading!
    var mockFavouritesRepository: FavouritesRepositoring!
   
    var marvelAPI: APIProvider {
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
    
    var imageLoader: ImageLoading {
        mockImageLoader
    }
}
