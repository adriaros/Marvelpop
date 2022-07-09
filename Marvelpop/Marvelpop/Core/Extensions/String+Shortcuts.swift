//
//  String+Shortcuts.swift
//  Marvelpop
//
//  Created by Adrià Ros on 9/7/22.
//

import Foundation

extension String {
    
    var isBlank: Bool {
        trimmingCharacters(in: CharacterSet.whitespaces).isEmpty
    }
}
