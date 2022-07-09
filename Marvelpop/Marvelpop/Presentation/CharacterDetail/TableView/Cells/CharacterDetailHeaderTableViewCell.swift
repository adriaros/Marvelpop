//
//  CharacterDetailImageTableViewCell.swift
//  Marvelpop
//
//  Created by Adrià Ros on 7/7/22.
//

import UIKit

class CharacterDetailHeaderTableViewCell: UITableViewCell {

    var imageLoader: ImageLoading?
    
    @IBOutlet weak var nameLabel: DSLabel!
    @IBOutlet weak var characterImageView: DSImageView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var lineView: UIView!
    
    static var cellType: String {
        String(describing: self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        backgroundImageView.alpha = 0.25
        backgroundImageView.contentMode = .scaleAspectFill
        characterImageView.contentMode = .scaleAspectFit
        lineView.backgroundColor = .separator
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        characterImageView.style = .rounded
    }
    
    func configure(character name: String?, imageUrl: URL?) {
        nameLabel.style = .title(name, .left, true, 0)
        imageLoader?.load(imageFrom: imageUrl, completion: { data in
            self.characterImageView.image = data ?? ImageAssets.CharacterDetail.logo.image
        })
    }
    
    func configure(background imageURL: URL?) {
        imageLoader?.load(imageFrom: imageURL, completion: { data in
            self.backgroundImageView.image = data ?? ImageAssets.CharacterDetail.logo.image
        })
    }
}
