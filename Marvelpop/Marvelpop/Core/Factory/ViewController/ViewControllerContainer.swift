//
//  ViewControllerContainer.swift
//  Marvelpop
//
//  Created by Adrià Ros on 6/7/22.
//

import Foundation

class ViewControllerContainer: ViewControllerFactory {
    
    private let container: DependencyFactory
    
    init(container: DependencyFactory) {
        self.container = container
    }
    
    func makeTabBar() -> TabBarController {
        TabBarController()
    }
    
    func makeHome(coordinator: HomeRouting) -> HomeViewController {
        HomeRouter.createModule(coordinator: coordinator, dataProvider: container.charactersRepository, imageLoader: container.imageLoaderUseCase) as! HomeViewController
    }
    
    func makeFavourites(coordinator: FavouritesRouting) -> FavouritesViewController {
        FavouritesRouter.createModule(coordinator: coordinator, dataProvider: container.favouritesRepository, imageLoader: container.imageLoaderUseCase) as! FavouritesViewController
    }
    
    func makeCharacterDetail(characterID: Int) -> CharacterDetailViewController {
        CharacterDetailRouter.createModule(characterID: characterID, characters: container.charactersRepository, favourites: container.favouritesRepository, imageLoader: container.imageLoaderUseCase) as! CharacterDetailViewController
    }
}
