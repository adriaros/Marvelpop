//
//  UIColor+UserInterfaceStyle.swift
//  Marvelpop
//
//  Created by Adrià Ros on 8/7/22.
//

import UIKit

extension UIColor {
    
    class var title: UIColor {
        UIColor { $0.userInterfaceStyle == .dark ? .white : .black }
    }
    
    class var paragraph: UIColor {
        UIColor { $0.userInterfaceStyle == .dark ? .white.withAlphaComponent(0.8) : .black.withAlphaComponent(0.8) }
    }
    
    class var tabBarSelectedItem: UIColor {
        UIColor { $0.userInterfaceStyle == .dark ? .gray : .white.withAlphaComponent(0.8) }
    }
    
    class var tabBarUnselectedItem: UIColor {
        UIColor { $0.userInterfaceStyle == .dark ? .darkGray : .lightGray }
    }
    
    class var textFieldText: UIColor {
        UIColor { $0.userInterfaceStyle == .dark ? .white.withAlphaComponent(0.8) : .lightGray }
    }
}
