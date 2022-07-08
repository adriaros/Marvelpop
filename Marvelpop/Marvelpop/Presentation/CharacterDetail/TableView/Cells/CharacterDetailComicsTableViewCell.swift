//
//  CharacterDetailComicsTableViewCell.swift
//  Marvelpop
//
//  Created by Adrià Ros on 8/7/22.
//

import UIKit

class CharacterDetailComicsTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: DSLabel!
    @IBOutlet weak var titleLineView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    static var cellType: String {
        String(describing: self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        titleLineView.backgroundColor = .separator
    }
    
    func configure(title: String) {
        titleLabel.style = .title(title, .black, .white, .left, true, 1)
    }
}
