//
//  DSLabel.swift
//  Marvelpop
//
//  Created by Adrià Ros on 7/7/22.
//

import UIKit

enum DSLabelStyle: Equatable {
    case title(_ text: String?, _ alignment: NSTextAlignment = .left, _ adjustsFontSizeToFitWidth: Bool = true, _ numberOfLines: Int = 0)
    case paragraph(_ text: String?, _ alignment: NSTextAlignment = .left, _ adjustsFontSizeToFitWidth: Bool = true, _ numberOfLines: Int = 0)
    case subtitle(_ text: String?, _ alignment: NSTextAlignment = .left, _ adjustsFontSizeToFitWidth: Bool = true, _ numberOfLines: Int = 0)
    case none
}

final class DSLabel: UILabel {
    
    var style: DSLabelStyle = .none {
        didSet {
            switch style {
            case let .title(text, alignment, adjustsFontSizeToFitWidth, numberOfLines):
                configure(text: text, color: .title, font: .noteworthyTitle, alignment: alignment, adjustsFontSizeToFitWidth: adjustsFontSizeToFitWidth, numberOfLines: numberOfLines)
                
            case let .paragraph(text, alignment, adjustsFontSizeToFitWidth, numberOfLines):
                configure(text: text, color: .paragraph, font: .noteworthyParagraph, alignment: alignment, adjustsFontSizeToFitWidth: adjustsFontSizeToFitWidth, numberOfLines: numberOfLines)
                
            case let .subtitle(text, alignment, adjustsFontSizeToFitWidth, numberOfLines):
                configure(text: text, color: .title, font: .noteworthySubtitle, alignment: alignment, adjustsFontSizeToFitWidth: adjustsFontSizeToFitWidth, numberOfLines: numberOfLines)
                
            case .none:
                break
            }
        }
    }
    
    private func configure(text: String?, color: UIColor, font: UIFont, alignment: NSTextAlignment, adjustsFontSizeToFitWidth: Bool, numberOfLines: Int) {
        self.text = text
        self.font = font
        self.textAlignment = alignment
        self.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth
        self.numberOfLines = numberOfLines
        self.textColor = color
    }
}
