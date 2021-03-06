//
//  SceneDelegate.swift
//  Marvelpop
//
//  Created by Adrià Ros on 6/7/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var viewControllerContainer: ViewControllerFactory
    var mainCoordinator: Coordinator!
    
    override init() {
        viewControllerContainer = ViewControllerContainer(container: DependencyContainer())
    }
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        mainCoordinator = MainCoordinator(window: window, container: viewControllerContainer)
        mainCoordinator.start()
    }
}
