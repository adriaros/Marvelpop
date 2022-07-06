//
//  UITabBarItem+Appearance.swift
//  Marvelpop
//
//  Created by Adrià Ros on 6/7/22.
//

import UIKit

extension UITabBarItem {
    
    static func setupAppearance() {
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Noteworthy Bold", size: 10.0) ?? .systemFont(ofSize: 10.0)],
                                                         for: .normal)
    }
}
