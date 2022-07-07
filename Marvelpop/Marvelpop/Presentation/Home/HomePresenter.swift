//
//  HomePresenter.swift
//  Marvelpop
//
//  Created by Adrià Ros on 6/7/22.
//

import UIKit

class HomePresenter: HomeViewToPresenterProtocol {
    
    var view: HomePresenterToViewProtocol?
    var interactor: HomePresenterToInteractorProtocol?
    var router: HomePresenterToRouterProtocol?
    
    var shouldShowLoadingCell: Bool = true
    
    var items: [Character]? {
        didSet {
            view?.tableView.reloadData()
        }
    }
    
    func setupView() {
        configureBackgroundView()
        configureKeywordView()
    }
    
    func configureBackgroundView() {
        view?.backgroundImageView.image = ImageAssets.Home.logo.image
        view?.backgroundImageView.alpha = 0.25
    }
    
    func configureKeywordView() {
        view?.keywordContainerView.style = .rounded
        view?.keywordContainerView.backgroundColor = .white
        view?.keywordTextField.returnKeyType = .search
        view?.keywordEraserButton.setImage(ImageAssets.Home.eraser.image, for: .normal)
        view?.separatorView.backgroundColor = .lightGray
    }
    
    func updateView(loader: Bool) {
        if loader {
            view?.showActivityIndicator()
            items?.removeAll()
        }
        
        interactor?.loadData(keyword: view?.keywordTextField.text, reset: loader)
    }
    
    func characterSelected(at row: Int) {
        guard let characterID = items?[row].id else {
            return
        }
        
        router?.pushToCharacterDetailWith(id: characterID)
    }
}

extension HomePresenter: HomeInteractorToPresenterProtocol {
    
    func didLoad(_ data: [Character]) {
        view?.hideActivityIndicator()
        items = data
    }
    
    func throwError() {
        view?.hideActivityIndicator()
        view?.showErrorAlert()
    }
}
