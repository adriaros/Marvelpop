//
//  HomeRouter.swift
//  Marvelpop
//
//  Created by Adrià Ros on 6/7/22.
//

import UIKit

final class HomeRouter: HomePresenterToRouterProtocol {
    
    private var coordinator: HomeRouting?
        
    class func createModule(coordinator: HomeRouting, dataProvider: CharactersRepositoring, imageLoader: ImageLoading) -> HomeViewController {
        
        let view = HomeViewController()
        let presenter = HomePresenter()
        let interactor = HomeInteractor()
        let router = HomeRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        view.activityIndicator = ActivityIndicatorView(style: .large)
        view.alerts = AlertController()
        view.imageLoader = imageLoader
        interactor.dataProvider = dataProvider
        router.coordinator = coordinator
        
        return view
    }
    
    func pushToCharacterDetailWith(id: Int) {
        coordinator?.pushToCharacterDetailWith(id: id)
    }
}
