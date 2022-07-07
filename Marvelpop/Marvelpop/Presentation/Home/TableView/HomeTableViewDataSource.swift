//
//  HomeTableViewDataSource.swift
//  Marvelpop
//
//  Created by Adrià Ros on 7/7/22.
//

import UIKit

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let items = presenter?.items else {
            fatalError("Could not load items in Home")
        }
        
        if isLoadingIndexPath(indexPath) {
            let cell = tableView.dequeueReusableCell(withIdentifier: LoadingTableViewCell.cellType, for: indexPath) as! LoadingTableViewCell
            cell.start()
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeItemTableViewCell.cellType, for: indexPath) as! HomeItemTableViewCell
        cell.imageLoader = imageLoader
        cell.configure(title: items[indexPath.row].displayName, description: items[indexPath.row].displayDescription, image: items[indexPath.row].listImageURL)
        return cell
    }
}
