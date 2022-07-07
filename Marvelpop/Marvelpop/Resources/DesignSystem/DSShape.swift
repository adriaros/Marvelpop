//
//  DSShape.swift
//  Marvelpop
//
//  Created by Adrià Ros on 7/7/22.
//

import UIKit

enum DSShapeStyle: Equatable {
    case rounded
    case none
}

class DSShape: UIView {
    
    var style: DSShapeStyle = .none {
        didSet {
            switch style {
            case .rounded:
                configure(cornerRadius: 12, shadowColor: UIColor.gray.cgColor, shadowOpacity: 0.4, shadowRadius: 4.0)
                
            case .none:
                break
            }
        }
    }
    
    private func configure(cornerRadius: CGFloat, shadowColor: CGColor, shadowOpacity: Float, shadowRadius: CGFloat) {
        layer.cornerRadius = cornerRadius
        layer.shadowColor = shadowColor
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
        layer.shadowOffset = .zero
        backgroundColor = UIColor { $0.userInterfaceStyle == .dark ? .darkGray : .white }
    }
}
