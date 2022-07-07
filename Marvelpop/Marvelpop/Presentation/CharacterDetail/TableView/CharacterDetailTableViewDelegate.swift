//
//  CharacterDetailTableViewDelegate.swift
//  Marvelpop
//
//  Created by Adrià Ros on 7/7/22.
//

import UIKit

extension CharacterDetailViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath.row == 0 ? UIScreen.main.bounds.width / 2 : UITableView.automaticDimension
    }
}
