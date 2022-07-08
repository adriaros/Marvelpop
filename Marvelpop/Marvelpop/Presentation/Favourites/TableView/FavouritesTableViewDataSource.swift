//
//  FavouritesTableViewDataSource.swift
//  Marvelpop
//
//  Created by Adrià Ros on 7/7/22.
//

import UIKit

extension FavouritesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let items = presenter?.items else {
            fatalError("Could not load items in Favourites")
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CharacterListItemTableViewCell.cellType, for: indexPath) as! CharacterListItemTableViewCell
        cell.imageLoader = imageLoader
        cell.configure(title: items[indexPath.row].displayName, description: items[indexPath.row].displayDescription, image: items[indexPath.row].listImageURL)
        return cell
    }
}
