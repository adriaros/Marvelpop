//
//  TabBarController.swift
//  Marvelpop
//
//  Created by Adrià Ros on 6/7/22.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.backgroundColor = .tabBarSelectedItem
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .tabBarUnselectedItem
        UITabBarItem.setupAppearance()
    }
}
