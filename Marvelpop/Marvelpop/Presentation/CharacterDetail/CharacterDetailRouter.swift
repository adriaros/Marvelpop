//
//  CharacterDetailRouter.swift
//  Marvelpop
//
//  Created by Adrià Ros on 7/7/22.
//

import UIKit

final class CharacterDetailRouter: CharacterDetailPresenterToRouterProtocol {
        
    class func createModule(characterID: Int, characters: CharactersRepositoring, favourites: FavouritesRepositoring, imageLoader: ImageLoading) -> UIViewController {
        
        let view = CharacterDetailViewController()
        let presenter = CharacterDetailPresenter()
        let interactor = CharacterDetailInteractor()
        let router = CharacterDetailRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        view.activityIndicator = ActivityIndicatorView(style: .large)
        view.alerts = AlertController()
        view.imageLoader = imageLoader
        interactor.characters = characters
        interactor.favourites = favourites
        interactor.characterID = characterID
        
        return view
    }
}
