//
//  ViewControllerContainer.swift
//  Marvelpop
//
//  Created by Adrià Ros on 6/7/22.
//

import Foundation

class ViewControllerContainer: ViewControllerFactory {
    
    var container: DependencyFactory
    
    init(container: DependencyFactory) {
        self.container = container
    }
    
    func makeTabBar() -> TabBarController {
        TabBarController()
    }
    
    func makeHome(coordinator: HomeRouting) -> HomeViewController {
        HomeRouter.createModule() as! HomeViewController
    }
    
    func makeFavourites(coordinator: FavouritesRouting) -> FavouritesViewController {
        FavouritesRouter.createModule() as! FavouritesViewController
    }
}
