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
}

protocol CharacterDetailInteractorToPresenterProtocol: AnyObject {
    func didLoad(_ data: Character?, favourite: Bool)
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
    var isFavourite: Bool { get }
    func setupView()
    func handleFavourite()
}

protocol CharacterDetailPresenterToRouterProtocol: AnyObject {
    static func createModule(characterID: Int, characters: CharactersRepositoryProtocol, favourites: FavouritesRepositoryProtocol, imageLoader: ImageLoaderUseCaseProtocol) -> UIViewController
}
