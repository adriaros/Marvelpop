//
//  FavouritesRouter.swift
//  Marvelpop
//
//  Created by Adrià Ros on 6/7/22.
//

import UIKit

class FavouritesRouter: FavouritesPresenterToRouterProtocol {
        
    class func createModule() -> UIViewController {
        
        let view = FavouritesViewController()
        let presenter = FavouritesPresenter()
        let interactor = FavouritesInteractor()
        let router = FavouritesRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
}
