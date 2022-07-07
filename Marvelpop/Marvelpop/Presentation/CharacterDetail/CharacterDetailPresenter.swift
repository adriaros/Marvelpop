//
//  CharacterDetailPresenter.swift
//  Marvelpop
//
//  Created by Adrià Ros on 7/7/22.
//

import UIKit

class CharacterDetailPresenter: CharacterDetailViewToPresenterProtocol {
    
    var view: CharacterDetailPresenterToViewProtocol?
    var interactor: CharacterDetailPresenterToInteractorProtocol?
    var router: CharacterDetailPresenterToRouterProtocol?
    
    var isFavourite: Bool = false {
        didSet {
            isFavourite ? view?.showFavouriteButton() : view?.showNotFavouriteButton()
        }
    }
    
    var character: Character? {
        didSet {
            view?.tableView.reloadData()
        }
    }
    
    func setupView() {
        interactor?.loadData()
    }
    
    func handleFavourite() {
        interactor?.handleFavourite()
    }
}

extension CharacterDetailPresenter: CharacterDetailInteractorToPresenterProtocol {
    
    func didLoad(_ data: Character?, favourite: Bool) {
        isFavourite = favourite
        character = data
    }
}
