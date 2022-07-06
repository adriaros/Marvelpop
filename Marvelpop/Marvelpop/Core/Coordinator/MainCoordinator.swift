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
    
    var rootViewController: TabBarController!
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        
        let homeCoordinator = HomeCoordinator()
        startChild(homeCoordinator)

        let favouritesCoordinator = FavouritesCoordinator()
        startChild(favouritesCoordinator)
        
        guard let home = childCoordinators[0].navigationController else {
            fatalError("Fatal error. Home navigation controller does not exist. Tab Bar controller can not be constructed")
        }
        
        home.tabBarItem = UITabBarItem(title: "tabbar_home".localized, image: UIImage(systemName: "heart.fill"), selectedImage: UIImage(systemName: "heart.fill"))
        home.tabBarItem.tag = 0
        
        guard let favourites = childCoordinators[1].navigationController else {
            fatalError("Fatal error. Favourites navigation controller does not exist. Tab Bar controller can not be constructed")
        }
        
        favourites.tabBarItem = UITabBarItem(title: "tabbar_favourites".localized, image: UIImage(systemName: "heart.fill"), selectedImage: UIImage(systemName: "heart.fill"))
        favourites.tabBarItem.tag = 1
        
        rootViewController = TabBarController()
        rootViewController.viewControllers = [home, favourites]
        rootViewController.modalPresentationStyle = .fullScreen
        
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
    }
}
