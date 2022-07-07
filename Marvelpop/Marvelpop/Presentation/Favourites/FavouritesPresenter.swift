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
    
    var items: [Favourite]? {
        didSet {
            view?.emptyLabel.isHidden = (items?.count ?? 0) > 0
            view?.tableView.reloadData()
        }
    }
    
    func setupView() {
        view?.backgroundImageView.image = ImageAssets.Favourites.logo.image
        view?.backgroundImageView.alpha = 0.25
        view?.emptyLabel.style = .title("favourites_empty".localized, .black, .white, .center, true, 0)
    }
    
    func updateView() {
        interactor?.loadData()
    }
    
    func favouriteSelected(at row: Int) {
        guard let favouriteID = items?[row].id else {
            return
        }
        
        router?.pushToCharacterDetailWith(id: favouriteID)
    }
}

extension FavouritesPresenter: FavouritesInteractorToPresenterProtocol {
    
    func didLoad(_ data: [Favourite]) {
        items = data
    }
}
