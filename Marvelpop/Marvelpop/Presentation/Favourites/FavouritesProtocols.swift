//
//  FavouritesProtocols.swift
//  Marvelpop
//
//  Created by Adrià Ros on 6/7/22.
//

import UIKit

protocol FavouritesPresenterToViewProtocol: AnyObject {
    var presenter: FavouritesViewToPresenterProtocol? { get set }
}

protocol FavouritesInteractorToPresenterProtocol: AnyObject {
}

protocol FavouritesPresenterToInteractorProtocol: AnyObject {
    var presenter: FavouritesInteractorToPresenterProtocol? { get set }
}

protocol FavouritesViewToPresenterProtocol: AnyObject {
    var view: FavouritesPresenterToViewProtocol? { get set }
    var interactor: FavouritesPresenterToInteractorProtocol? { get set }
    var router: FavouritesPresenterToRouterProtocol? { get set }
    func setupView()
}

protocol FavouritesPresenterToRouterProtocol: AnyObject {
    static func createModule() -> UIViewController
}
