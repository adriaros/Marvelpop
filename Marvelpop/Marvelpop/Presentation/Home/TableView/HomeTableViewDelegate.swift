//
//  HomeTableViewDelegate.swift
//  Marvelpop
//
//  Created by Adrià Ros on 7/7/22.
//

import UIKit

extension HomeViewController: UITableViewDelegate {
    
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
        presenter?.characterSelected(at: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if isLoadingIndexPath(indexPath) {
            presenter?.updateView(loader: false)
        }
    }
    
    func isLoadingIndexPath(_ indexPath: IndexPath) -> Bool {
        guard let shouldShowLoadingCell = presenter?.shouldShowLoadingCell, let items = presenter?.items else {
            return false
        }
        
        guard shouldShowLoadingCell, items.count > 0 else {
            return false
        }
        
        return indexPath.row == items.count-1
    }
}
