//
//  DependencyContainer.swift
//  Marvelpop
//
//  Created by Adrià Ros on 6/7/22.
//

import Foundation

class DependencyContainer: DependencyFactory {
    
    lazy var marvelAPI: MarvelAPIProtocol = {
        MarvelAPI()
    }()
    
    lazy var imageCache: ImageCacheProtocol = {
        ImageCache()
    }()
    
    lazy var coreDataManager: CoreDataManagerProtocol = {
       CoreDataManager()
    }()
    
    lazy var coreDataFavouriteWrapper: CoreDataFavouriteWrapperProtocol = {
       CoreDataFavouriteWrapper(manager: coreDataManager)
    }()
    
    lazy var charactersRepository: CharactersRepositoryProtocol = {
        CharactersRepository(api: marvelAPI)
    }()
    
    lazy var mediaRepository: MediaRepositoryProtocol = {
        MediaRepository(api: marvelAPI, cache: imageCache)
    }()
    
    lazy var favouritesRepository: FavouritesRepositoryProtocol = {
        FavouritesRepository(dbWrapper: coreDataFavouriteWrapper)
    }()
    
    lazy var imageLoaderUseCase: ImageLoaderUseCaseProtocol = {
        ImageLoaderUseCase(provider: mediaRepository)
    }()
}
