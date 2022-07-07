//
//  HomeItemTableViewCell.swift
//  Marvelpop
//
//  Created by Adrià Ros on 7/7/22.
//

import UIKit

class HomeItemTableViewCell: UITableViewCell {
    
    var imageLoader: ImageLoaderUseCaseProtocol?

    @IBOutlet weak var containerShape: DSShape!
    @IBOutlet weak var titleLabel: DSLabel!
    @IBOutlet weak var descriptionLabel: DSLabel!
    @IBOutlet weak var containerImageView: DSImageView!
    
    static var cellType: String {
        String(describing: self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        backgroundColor = .clear
        containerImageView.contentMode = .scaleAspectFit
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        containerShape.style = .rounded
        containerShape.alpha = 0.9
        containerImageView.style = .rounded
    }
    
    override func prepareForReuse() {
        containerImageView.image = nil
    }
    
    func configure(title: String, description: String, image url: URL?) {
        titleLabel.style = .title(title, .black, .white, .left, false, 1)
        descriptionLabel.style = .paragraph(description, .black.withAlphaComponent(0.8), .white.withAlphaComponent(0.8), .left, false, 2)
        imageLoader?.load(imageFrom: url, completion: { data in
            self.containerImageView.image = data ?? ImageAssets.Home.logo.image
        })
    }
}
