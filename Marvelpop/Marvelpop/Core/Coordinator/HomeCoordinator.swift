//
//  HomeCoordinator.swift
//  Marvelpop
//
//  Created by Adrià Ros on 6/7/22.
//

import UIKit

class HomeCoordinator: Coordinator {
    
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
        let homeViewController = container.makeHome(coordinator: self)
        homeViewController.navigationItem.title = "navigation_title_home".localized
        navigationController = UINavigationController(rootViewController: homeViewController)
    }
    
    @IBAction func back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

extension HomeCoordinator: HomeRouting {
    
    func pushToCharacterDetailWith(id: Int) {
        let characterDetailViewController = container.makeCharacterDetail(characterID: id)
        characterDetailViewController.navigationItem.leftBarButtonItem = backButtonItem
        characterDetailViewController.navigationItem.title = "ID: \(id)"
        characterDetailViewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(characterDetailViewController, animated: true)
    }
}
