//
//  FavouritesProtocols.swift
//  Marvelpop
//
//  Created by Adrià Ros on 6/7/22.
//

import UIKit

protocol FavouritesPresenterToViewProtocol: AnyObject {
    var presenter: FavouritesViewToPresenterProtocol? { get set }
    var tableView: UITableView! { get set }
    var backgroundImageView: UIImageView! { get set }
    var emptyLabel: DSLabel! { get set }
    func enableTrashButton()
    func disableTrashButton()
}

protocol FavouritesInteractorToPresenterProtocol: AnyObject {
    func didLoad(_ data: [Favourite])
}

protocol FavouritesPresenterToInteractorProtocol: AnyObject {
    var presenter: FavouritesInteractorToPresenterProtocol? { get set }
    func loadData()
    func deleteAll()
}

protocol FavouritesViewToPresenterProtocol: AnyObject {
    var view: FavouritesPresenterToViewProtocol? { get set }
    var interactor: FavouritesPresenterToInteractorProtocol? { get set }
    var router: FavouritesPresenterToRouterProtocol? { get set }
    var items: [Favourite]? { get set }
    func setupView()
    func updateView()
    func favouriteSelected(at row: Int)
    func requestDelete()
}

protocol FavouritesPresenterToRouterProtocol: AnyObject {
    static func createModule(coordinator: FavouritesRouting, dataProvider: FavouritesRepositoring?, imageLoader: ImageLoading) -> UIViewController
    func pushToCharacterDetailWith(id: Int)
}
