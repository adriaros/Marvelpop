//
//  HomeCoordinator.swift
//  Marvelpop
//
//  Created by Adrià Ros on 6/7/22.
//

import UIKit

class HomeCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController?
        
    init() {
        
    }
    
    func start() {
        let homeViewController = HomeRouter.createModule() as! HomeViewController
        homeViewController.navigationItem.title = "navigation_title_home".localized
        navigationController = UINavigationController(rootViewController: homeViewController)
    }
    
    @IBAction func back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

extension HomeCoordinator: HomeRouting {
    
    func pushToCharacterDetailWith(id: Int) {
        
    }
}

