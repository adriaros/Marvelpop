//
//  CharacterDetailProtocols.swift
//  Marvelpop
//
//  Created by Adrià Ros on 7/7/22.
//

import UIKit

protocol CharacterDetailPresenterToViewProtocol: AnyObject {
    var presenter: CharacterDetailViewToPresenterProtocol? { get set }
    var tableView: UITableView! { get set }
    func showActivityIndicator()
    func hideActivityIndicator()
    func showErrorAlert()
    func showFavouriteButton()
    func showNotFavouriteButton()
}

protocol CharacterDetailInteractorToPresenterProtocol: AnyObject {
    var isFavourite: Bool { get set }
    func didLoad(_ data: Character?, favourite: Bool)
    func throwError()
}

protocol CharacterDetailPresenterToInteractorProtocol: AnyObject {
    var presenter: CharacterDetailInteractorToPresenterProtocol? { get set }
    func loadData()
    func handleFavourite()
}

protocol CharacterDetailViewToPresenterProtocol: AnyObject {
    var view: CharacterDetailPresenterToViewProtocol? { get set }
    var interactor: CharacterDetailPresenterToInteractorProtocol? { get set }
    var router: CharacterDetailPresenterToRouterProtocol? { get set }
    var character: Character? { get set }
    func setupView()
    func handleFavourite()
}

protocol CharacterDetailPresenterToRouterProtocol: AnyObject {
    static func createModule(characterID: Int, characters: CharactersRepositoryProtocol, favourites: FavouritesRepositoryProtocol, imageLoader: ImageLoaderUseCaseProtocol) -> UIViewController
}
