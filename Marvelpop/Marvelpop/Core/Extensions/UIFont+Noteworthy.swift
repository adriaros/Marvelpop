//
//  UIFont+Noteworthy.swift
//  Marvelpop
//
//  Created by Adrià Ros on 7/7/22.
//

import UIKit

extension UIFont {
    
    class var noteworthyHeader: UIFont {
        UIFont(name: "Noteworthy Bold", size: 24.0) ?? .systemFont(ofSize: 24.0)
    }
    
    class var noteworthyTitle: UIFont {
        UIFont(name: "Noteworthy Bold", size: 20.0) ?? .systemFont(ofSize: 20.0)
    }
    
    class var noteworthyNavigation: UIFont {
        UIFont(name: "Noteworthy Bold", size: 16.0) ?? .systemFont(ofSize: 16.0)
    }
    
    class var noteworthyParagraph: UIFont {
        UIFont(name: "Noteworthy Light", size: 18.0) ?? .systemFont(ofSize: 18.0)
    }
    
    class var noteworthySubtitle: UIFont {
        UIFont(name: "Noteworthy Light", size: 14.0) ?? .systemFont(ofSize: 14.0)
    }
    
    class var noteworthyTabBar: UIFont {
        UIFont(name: "Noteworthy Bold", size: 10.0) ?? .systemFont(ofSize: 10.0)
    }
}
