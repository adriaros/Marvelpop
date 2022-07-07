//
//  DSTextField.swift
//  Marvelpop
//
//  Created by Adrià Ros on 7/7/22.
//

import UIKit

enum DSTextFieldStyle: Equatable {
    case basic(_ placeholder: String)
    case none
}

class DSTextField: UITextField {
    
    var style: DSTextFieldStyle = .none {
        didSet {
            switch style {
            case let .basic(placeholder):
                configure(placeholder: placeholder)
                
            case .none:
                break
            }
        }
    }
    
    func configure(placeholder: String?) {
        font = UIFont.noteworthyParagraph
        textColor = .black
        
        let placeholderTextColor = UIColor { $0.userInterfaceStyle == .dark ? .white.withAlphaComponent(0.8) : .lightGray }
        attributedPlaceholder = NSAttributedString(string: placeholder ?? "", attributes: [.foregroundColor: placeholderTextColor, .font: UIFont.noteworthyParagraph])
    }
}
