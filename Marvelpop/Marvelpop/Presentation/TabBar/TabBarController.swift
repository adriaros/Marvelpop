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
        tabBar.backgroundColor = UIColor { traitCollection in
            traitCollection.userInterfaceStyle == .dark ? .gray : .white.withAlphaComponent(0.8)
        }
        
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = UIColor { traitCollection in
            traitCollection.userInterfaceStyle == .dark ? .darkGray : .lightGray
        }
        
        UITabBarItem.setupAppearance()
    }
}
