//
//  CharacterDetailRouter.swift
//  Marvelpop
//
//  Created by Adrià Ros on 7/7/22.
//

import UIKit

class CharacterDetailRouter: CharacterDetailPresenterToRouterProtocol {
        
    class func createModule(characterID: Int, characters: CharactersRepositoryProtocol, favourites: FavouritesRepositoryProtocol, imageLoader: ImageLoaderUseCaseProtocol) -> UIViewController {
        
        let view = CharacterDetailViewController()
        let presenter = CharacterDetailPresenter()
        let interactor = CharacterDetailInteractor()
        let router = CharacterDetailRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        view.imageLoader = imageLoader
        interactor.characters = characters
        interactor.favourites = favourites
        interactor.characterID = characterID
        
        return view
    }
}
