//
//  UIFont+Noteworthy.swift
//  Marvelpop
//
//  Created by Adrià Ros on 7/7/22.
//

import UIKit

extension UIFont {
    
    class var noteworthyHeader: UIFont {
        return UIFont(name: "Noteworthy Bold", size: 24.0) ?? .systemFont(ofSize: 24.0)
    }
    
    class var noteworthyTitle: UIFont {
        return UIFont(name: "Noteworthy Bold", size: 20.0) ?? .systemFont(ofSize: 20.0)
    }
    
    class var noteworthyNavigation: UIFont {
        return UIFont(name: "Noteworthy Bold", size: 16.0) ?? .systemFont(ofSize: 16.0)
    }
    
    class var noteworthyParagraph: UIFont {
        return UIFont(name: "Noteworthy Light", size: 16.0) ?? .systemFont(ofSize: 16.0)
    }
    
    class var noteworthyTabBar: UIFont {
        return UIFont(name: "Noteworthy Bold", size: 10.0) ?? .systemFont(ofSize: 10.0)
    }
}
