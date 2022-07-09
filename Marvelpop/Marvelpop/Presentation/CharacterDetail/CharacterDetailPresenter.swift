//
//  CharacterDetailPresenter.swift
//  Marvelpop
//
//  Created by Adrià Ros on 7/7/22.
//

import UIKit

final class CharacterDetailPresenter: CharacterDetailViewToPresenterProtocol {
    
    weak var view: CharacterDetailPresenterToViewProtocol?
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
        view?.showActivityIndicator()
        interactor?.loadData()
    }
    
    func handleFavourite() {
        interactor?.handleFavourite()
    }
}

extension CharacterDetailPresenter: CharacterDetailInteractorToPresenterProtocol {
    
    func didLoad(_ data: Character?, favourite: Bool) {
        view?.hideActivityIndicator()
        isFavourite = favourite
        character = data
    }
    
    func throwError() {
        view?.hideActivityIndicator()
        view?.showErrorAlert()
    }
}
