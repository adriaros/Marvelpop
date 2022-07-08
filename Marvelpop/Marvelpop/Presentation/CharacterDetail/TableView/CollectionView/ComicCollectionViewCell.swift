//
//  ComicCollectionViewCell.swift
//  Marvelpop
//
//  Created by Adrià Ros on 8/7/22.
//

import UIKit

class ComicCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var nameLabel: DSLabel!
    @IBOutlet weak var descriptionView: DSShape!
    
    static var cellType: String {
        String(describing: self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        itemImageView.image = ImageAssets.CharacterDetail.comic.image
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        descriptionView.style = .border
    }
    
    func configure(title: String) {
        nameLabel.style = .subtitle(title, .center, false, 2)
    }
}
