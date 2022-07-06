//
//  HomeProtocols.swift
//  Marvelpop
//
//  Created by Adrià Ros on 6/7/22.
//

import UIKit

protocol HomePresenterToViewProtocol: AnyObject {
    var presenter: HomeViewToPresenterProtocol? { get set }
}

protocol HomeInteractorToPresenterProtocol: AnyObject {
}

protocol HomePresenterToInteractorProtocol: AnyObject {
    var presenter: HomeInteractorToPresenterProtocol? { get set }
}

protocol HomeViewToPresenterProtocol: AnyObject {
    var view: HomePresenterToViewProtocol? { get set }
    var interactor: HomePresenterToInteractorProtocol? { get set }
    var router: HomePresenterToRouterProtocol? { get set }
    func setupView()
}

protocol HomePresenterToRouterProtocol: AnyObject {
    static func createModule() -> UIViewController
}
