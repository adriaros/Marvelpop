//
//  FavouritesRouter.swift
//  Marvelpop
//
//  Created by Adrià Ros on 6/7/22.
//

import UIKit

class FavouritesRouter: FavouritesPresenterToRouterProtocol {
        
    var coordinator: FavouritesRouting?
    
    class func createModule(coordinator: FavouritesRouting, dataProvider: FavouritesRepositoryProtocol?, imageLoader: ImageLoaderUseCaseProtocol) -> UIViewController {
        
        let view = FavouritesViewController()
        let presenter = FavouritesPresenter()
        let interactor = FavouritesInteractor()
        let router = FavouritesRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        view.imageLoader = imageLoader
        interactor.dataProvider = dataProvider
        router.coordinator = coordinator
        
        return view
    }
    
    func pushToCharacterDetailWith(id: Int) {
        coordinator?.pushToCharacterDetailWith(id: id)
    }
}
