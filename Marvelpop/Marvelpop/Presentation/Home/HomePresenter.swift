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
        view?.backgroundImageView.image = ImageAssets.Home.background.image
        view?.backgroundImageView.contentMode = .scaleAspectFit
        view?.backgroundImageView.alpha = 0.8
    }
    
    func configureKeywordView() {
        view?.keywordContainerView.style = .rounded
        view?.keywordTextField.style = .basic("home_textfield_placeholder".localized)
        view?.keywordTextField.returnKeyType = .search
        view?.keywordEraserButton.setImage(ImageAssets.Home.eraser.image, for: .normal)
        view?.separatorView.backgroundColor = .lightGray
    }
    
    func updateView(loader: Bool) {
        if loader {
            view?.showActivityIndicator()
            view?.resultsLabel.style = .paragraph(String(format: "home_results".localized, ". . ."), .left, true, 1)
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
    
    func didLoad(_ data: [Character], total: Int?) {
        view?.hideActivityIndicator()
        items = data
        view?.resultsLabel.style = .paragraph(String(format: "home_results".localized, String(total ?? 0)), .left, true, 1)
    }
    
    func throwError() {
        view?.hideActivityIndicator()
        view?.showErrorAlert()
    }
}
