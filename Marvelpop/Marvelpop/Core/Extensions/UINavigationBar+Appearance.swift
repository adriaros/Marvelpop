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
            NSAttributedString.Key.foregroundColor: UIColor { traitCollection in
                traitCollection.userInterfaceStyle == .dark ? .white : .black
            },
            NSAttributedString.Key.font: UIFont(name: "Noteworthy Bold", size: 16.0) ?? .systemFont(ofSize: 16.0)
        ]
    }
}
