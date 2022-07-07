//
//  FavouritesTableViewDelegate.swift
//  Marvelpop
//
//  Created by Adrià Ros on 7/7/22.
//

import UIKit

extension FavouritesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.3) {
            tableView.cellForRow(at: indexPath)?.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
        }
    }
    
    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.3) {
            tableView.cellForRow(at: indexPath)?.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.favouriteSelected(at: indexPath.row)
    }
}
