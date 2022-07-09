//
//  UINavigationBar+Appearance.swift
//  Marvelpop
//
//  Created by Adrià Ros on 6/7/22.
//

import UIKit

extension UINavigationBar {
    
    static func setupAppearance() {
        UINavigationBar.appearance().titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor { $0.userInterfaceStyle == .dark ? .white : .black },
            NSAttributedString.Key.font: UIFont.navigation
        ]
    }
}
