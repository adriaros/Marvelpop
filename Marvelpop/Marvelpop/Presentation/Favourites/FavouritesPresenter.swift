//
//  FavouritesPresenter.swift
//  Marvelpop
//
//  Created by Adrià Ros on 6/7/22.
//

import UIKit

class FavouritesPresenter: FavouritesViewToPresenterProtocol {
    
    var view: FavouritesPresenterToViewProtocol?
    var interactor: FavouritesPresenterToInteractorProtocol?
    var router: FavouritesPresenterToRouterProtocol?
    
    func setupView() {
    }
}

extension FavouritesPresenter: FavouritesInteractorToPresenterProtocol {
    
}
