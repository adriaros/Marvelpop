//
//  UIDevice+UserInterfaceIdiom.swift
//  Marvelpop
//
//  Created by Adrià Ros on 7/7/22.
//

import UIKit

extension UIDevice {
    
    static var isPad: Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }
}
