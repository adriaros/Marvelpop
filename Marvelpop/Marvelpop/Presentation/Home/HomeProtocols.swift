//
//  HomeProtocols.swift
//  Marvelpop
//
//  Created by Adrià Ros on 6/7/22.
//

import UIKit

protocol HomePresenterToViewProtocol: AnyObject {
    var presenter: HomeViewToPresenterProtocol? { get set }
    var tableView: UITableView! { get set }
    var backgroundImageView: UIImageView! { get set }
    var activityIndicator: ActivityIndicatorView? { get set }
    func showActivityIndicator()
    func hideActivityIndicator()
    func showErrorAlert()
}

protocol HomeInteractorToPresenterProtocol: AnyObject {
    var shouldShowLoadingCell: Bool { get set }
    func didLoad(_ data: [Character])
    func throwError()
}

protocol HomePresenterToInteractorProtocol: AnyObject {
    var presenter: HomeInteractorToPresenterProtocol? { get set }
    func loadData()
}

protocol HomeViewToPresenterProtocol: AnyObject {
    var view: HomePresenterToViewProtocol? { get set }
    var interactor: HomePresenterToInteractorProtocol? { get set }
    var router: HomePresenterToRouterProtocol? { get set }
    var shouldShowLoadingCell: Bool { get set }
    var items: [Character]? { get set }
    func setupView()
    func updateView(loader: Bool)
    func characterSelected(at row: Int)
}

protocol HomePresenterToRouterProtocol: AnyObject {
    static func createModule(coordinator: HomeRouting, dataProvider: CharactersRepositoryProtocol, imageLoader: ImageLoaderUseCaseProtocol) -> UIViewController
    func pushToCharacterDetailWith(id: Int)
}
