//
//  FavouritesCoordinator.swift
//  Marvelpop
//
//  Created by Adrià Ros on 6/7/22.
//

import UIKit

class FavouritesCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController?
        
    let container: ViewControllerFactory
    
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
        
    }
}
