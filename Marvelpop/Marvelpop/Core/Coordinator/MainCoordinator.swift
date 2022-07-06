//
//  MainCoordinator.swift
//  Marvelpop
//
//  Created by Adrià Ros on 6/7/22.
//

import UIKit

class MainCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController?
    
    let window: UIWindow?
    let container: ViewControllerFactory
    
    var rootViewController: TabBarController!
    
    init(window: UIWindow?, container: ViewControllerFactory) {
        self.window = window
        self.container = container
    }
    
    func start() {
        let homeCoordinator = HomeCoordinator(container: container)
        startChild(homeCoordinator)

        let favouritesCoordinator = FavouritesCoordinator(container: container)
        startChild(favouritesCoordinator)
        
        guard let home = childCoordinators[0].navigationController else {
            fatalError("Fatal error. Home navigation controller does not exist. Tab Bar controller can not be constructed")
        }
        
        home.tabBarItem = UITabBarItem(title: "tabbar_home".localized,
                                       image: ImageAssets.TabBar.home.image,
                                       selectedImage: ImageAssets.TabBar.homeSelected.image)
        home.tabBarItem.tag = 0
        
        guard let favourites = childCoordinators[1].navigationController else {
            fatalError("Fatal error. Favourites navigation controller does not exist. Tab Bar controller can not be constructed")
        }
        
        favourites.tabBarItem = UITabBarItem(title: "tabbar_favourites".localized,
                                             image: ImageAssets.TabBar.favourites.image,
                                             selectedImage: ImageAssets.TabBar.favouritesSelected.image)
        favourites.tabBarItem.tag = 1
        
        rootViewController = container.makeTabBar()
        rootViewController.viewControllers = [home, favourites]
        rootViewController.modalPresentationStyle = .fullScreen
        
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
    }
}
