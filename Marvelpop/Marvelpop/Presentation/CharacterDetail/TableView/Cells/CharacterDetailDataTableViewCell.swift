//
//  CharacterDetailDataTableViewCell.swift
//  Marvelpop
//
//  Created by Adrià Ros on 7/7/22.
//

import UIKit

class CharacterDetailDataTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: DSLabel!
    @IBOutlet weak var titleLineView: UIView!
    @IBOutlet weak var descriptionLabel: DSLabel!
    
    static var cellType: String {
        String(describing: self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        titleLineView.backgroundColor = .separator
    }
    
    func configure(title: String, text: String) {
        titleLabel.style = .title(title, .left, true, 1)
        descriptionLabel.style = .paragraph(text, .left, true, 0)
    }
}
