//
//  DependencyContainer.swift
//  Marvelpop
//
//  Created by Adrià Ros on 6/7/22.
//

import Foundation

final class DependencyContainer: DependencyFactory {
    
    lazy var marvelAPI: APIProvider = {
        MarvelAPI()
    }()
    
    lazy var imageCache: ImageCaching = {
        ImageCache()
    }()
    
    lazy var coreDataManager: CoreDataManagerProtocol = {
       CoreDataManager()
    }()
    
    lazy var coreDataFavouriteWrapper: CoreDataFavouriteWrapping = {
       CoreDataFavouriteWrapper(manager: coreDataManager)
    }()
    
    lazy var charactersRepository: CharactersRepositoring = {
        CharactersRepository(api: marvelAPI)
    }()
    
    lazy var mediaRepository: MediaRepositoring = {
        MediaRepository(api: marvelAPI, cache: imageCache)
    }()
    
    lazy var favouritesRepository: FavouritesRepositoring = {
        FavouritesRepository(dbWrapper: coreDataFavouriteWrapper)
    }()
    
    lazy var imageLoaderUseCase: ImageLoaderUseCaseProtocol = {
        ImageLoaderUseCase(provider: mediaRepository)
    }()
}
