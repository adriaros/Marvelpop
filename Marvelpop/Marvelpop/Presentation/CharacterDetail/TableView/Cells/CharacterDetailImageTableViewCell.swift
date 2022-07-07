//
//  CharacterDetailImageTableViewCell.swift
//  Marvelpop
//
//  Created by Adrià Ros on 7/7/22.
//

import UIKit

protocol CharacterDetailImageTableViewCellDelegate: AnyObject {
    func onFavourite()
}

class CharacterDetailImageTableViewCell: UITableViewCell {

    var imageLoader: ImageLoaderUseCaseProtocol?
    
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var favouriteButton: UIButton!
    
    weak var delegate: CharacterDetailImageTableViewCellDelegate?
    
    private var isFavourite = false
    
    private var favouriteButtonImage: UIImage? {
        UIImage(systemName: isFavourite ? "suit.heart.fill" : "suit.heart")
    }
    
    static var cellType: String {
        String(describing: self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        characterImageView.contentMode = .scaleAspectFill
    }
    
    func configure(image url: URL?, favourite: Bool) {
        isFavourite = favourite
        favouriteButton.setImage(favouriteButtonImage, for: .normal)
        imageLoader?.load(imageFrom: url, completion: { data in
            self.characterImageView.image = data ?? ImageAssets.CharacterDetail.logo.image
        })
    }
    
    @IBAction func onFavourite(_ sender: Any) {
        isFavourite = !isFavourite
        favouriteButton.setImage(favouriteButtonImage, for: .normal)
        delegate?.onFavourite()
    }
}
