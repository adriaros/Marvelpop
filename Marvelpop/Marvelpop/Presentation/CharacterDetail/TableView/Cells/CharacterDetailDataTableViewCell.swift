//
//  CharacterDetailDataTableViewCell.swift
//  Marvelpop
//
//  Created by Adrià Ros on 7/7/22.
//

import UIKit

class CharacterDetailDataTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: DSLabel!
    @IBOutlet weak var descriptionLabel: DSLabel!
    
    private let layout = UICollectionViewFlowLayout()
    
    static var cellType: String {
        String(describing: self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func configure(character: Character) {
        nameLabel.style = .title(character.displayName, .black, .white, .left, true, 1)
        descriptionLabel.style = .paragraph(character.displayDescription, .black.withAlphaComponent(0.8), .white.withAlphaComponent(0.8), .left, true, 0)
    }
}
