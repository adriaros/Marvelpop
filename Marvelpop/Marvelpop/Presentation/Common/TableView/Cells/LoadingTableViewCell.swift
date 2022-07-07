//
//  LoadingTableViewCell.swift
//  Marvelpop
//
//  Created by Adrià Ros on 7/7/22.
//

import UIKit

class LoadingTableViewCell: UITableViewCell {

    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    
    static var cellType: String {
        String(describing: self)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        indicatorView.style = .medium
    }
    
    func start() {
        indicatorView.startAnimating()
    }
}
