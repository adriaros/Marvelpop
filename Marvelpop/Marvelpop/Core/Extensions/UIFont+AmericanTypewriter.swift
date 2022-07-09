//
//  UIFont+AmericanTypewriter.swift
//  Marvelpop
//
//  Created by Adrià Ros on 7/7/22.
//

import UIKit

extension UIFont {
    
    class var title: UIFont {
        UIFont(name: "AmericanTypewriter-Bold", size: 20.0) ?? .systemFont(ofSize: 20.0)
    }
    
    class var navigation: UIFont {
        UIFont(name: "AmericanTypewriter-Bold", size: 16.0) ?? .systemFont(ofSize: 16.0)
    }
    
    class var paragraph: UIFont {
        UIFont(name: "AmericanTypewriter", size: 18.0) ?? .systemFont(ofSize: 18.0)
    }
    
    class var subtitle: UIFont {
        UIFont(name: "AmericanTypewriter", size: 14.0) ?? .systemFont(ofSize: 14.0)
    }
    
    class var tabBar: UIFont {
        UIFont(name: "AmericanTypewriter-Bold", size: 10.0) ?? .systemFont(ofSize: 10.0)
    }
}
