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
    
    private let layout = UICollectionViewFlowLayout()
    
    static var cellType: String {
        String(describing: self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        titleLineView.backgroundColor = .separator
    }
    
    func configure(title: String, text: String) {
        titleLabel.style = .title(title, .black, .white, .left, true, 0)
        descriptionLabel.style = .paragraph(text, .black.withAlphaComponent(0.8), .white.withAlphaComponent(0.8), .left, true, 0)
    }
}
