//
//  String+Localization.swift
//  Marvelpop
//
//  Created by Adrià Ros on 6/7/22.
//

import Foundation

extension String {
    
    var localized: String {
        NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}
