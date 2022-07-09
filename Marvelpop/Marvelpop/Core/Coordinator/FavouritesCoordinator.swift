//
//  FavouritesCoordinator.swift
//  Marvelpop
//
//  Created by Adrià Ros on 6/7/22.
//

import UIKit

class FavouritesCoordinator: Coordinator {
    
    private var backButtonItem: UIBarButtonItem {
        UIBarButtonItem(image: ImageAssets.Navigation.back.image, style: .plain, target: self, action: #selector(back(_:)))
    }
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController?
        
    private let container: ViewControllerFactory
    
    init(container: ViewControllerFactory) {
        self.container = container
    }
    
    func start() {
        let favouritesViewController = container.makeFavourites(coordinator: self)
        favouritesViewController.navigationItem.title = "navigation_title_favourites".localized
        navigationController = UINavigationController(rootViewController: favouritesViewController)
    }
    
    @IBAction func back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

extension FavouritesCoordinator: FavouritesRouting {
    
    func pushToCharacterDetailWith(id: Int) {
        let characterDetailViewController = container.makeCharacterDetail(characterID: id)
        characterDetailViewController.navigationItem.leftBarButtonItem = backButtonItem
        characterDetailViewController.navigationItem.title = "ID: \(id)"
        characterDetailViewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(characterDetailViewController, animated: true)
    }
}
