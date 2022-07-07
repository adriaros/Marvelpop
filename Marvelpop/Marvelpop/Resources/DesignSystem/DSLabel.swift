//
//  DSLabel.swift
//  Marvelpop
//
//  Created by Adrià Ros on 7/7/22.
//

import UIKit

enum DSLabelStyle: Equatable {
    case header(_ text: String?, _ light: UIColor, _ dark: UIColor, _ alignment: NSTextAlignment = .left, _ adjustsFontSizeToFitWidth: Bool = true, _ numberOfLines: Int = 0)
    case title(_ text: String?, _ light: UIColor, _ dark: UIColor, _ alignment: NSTextAlignment = .left, _ adjustsFontSizeToFitWidth: Bool = true, _ numberOfLines: Int = 0)
    case paragraph(_ text: String?, _ light: UIColor, _ dark: UIColor, _ alignment: NSTextAlignment = .left, _ adjustsFontSizeToFitWidth: Bool = true, _ numberOfLines: Int = 0)
    case none
}

class DSLabel: UILabel {
    
    var style: DSLabelStyle = .none {
        didSet {
            switch style {
            case let .header(text, light, dark, alignment, adjustsFontSizeToFitWidth, numberOfLines):
                configure(text: text, light: light, dark: dark, font: .noteworthyHeader, alignment: alignment, adjustsFontSizeToFitWidth: adjustsFontSizeToFitWidth, numberOfLines: numberOfLines)
                
            case let .title(text, light, dark, alignment, adjustsFontSizeToFitWidth, numberOfLines):
                configure(text: text, light: light, dark: dark, font: .noteworthyTitle, alignment: alignment, adjustsFontSizeToFitWidth: adjustsFontSizeToFitWidth, numberOfLines: numberOfLines)
                
            case let .paragraph(text, light, dark, alignment, adjustsFontSizeToFitWidth, numberOfLines):
                configure(text: text, light: light, dark: dark, font: .noteworthyParagraph, alignment: alignment, adjustsFontSizeToFitWidth: adjustsFontSizeToFitWidth, numberOfLines: numberOfLines)
                
            case .none:
                break
            }
        }
    }
    
    private func configure(text: String?, light: UIColor, dark: UIColor, font: UIFont, alignment: NSTextAlignment, adjustsFontSizeToFitWidth: Bool, numberOfLines: Int) {
        self.text = text
        self.font = font
        self.textAlignment = alignment
        self.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth
        self.numberOfLines = numberOfLines
        self.textColor = UIColor { $0.userInterfaceStyle == .dark ? dark : light }
    }
}
