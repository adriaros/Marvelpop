//
//  ImageAssets.swift
//  Marvelpop
//
//  Created by Adrià Ros on 6/7/22.
//

import UIKit

enum ImageAssets {
    
    enum TabBar: String {
        
        var image: UIImage? {
            return UIImage(named: self.rawValue)?.withRenderingMode(.alwaysOriginal)
        }
        
        case homeSelected = "tabbar_home_selected"
        case home = "tabbar_home"
        case favouritesSelected = "tabbar_favourites_selected"
        case favourites = "tabbar_favourites"
    }
    
    enum Home: String {
        
        var image: UIImage? {
            return UIImage(named: self.rawValue)?.withRenderingMode(.alwaysOriginal)
        }
        
        case logo = "marvel_logo"
    }
    
    enum Favourites: String {
        
        var image: UIImage? {
            return UIImage(named: self.rawValue)?.withRenderingMode(.alwaysOriginal)
        }
        
        case logo = "marvel_logo"
    }
}
