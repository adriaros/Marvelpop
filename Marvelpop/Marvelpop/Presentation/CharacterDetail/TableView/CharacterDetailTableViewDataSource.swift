//
//  CharacterDetailTableViewDataSource.swift
//  Marvelpop
//
//  Created by Adrià Ros on 7/7/22.
//

import UIKit

extension CharacterDetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.character != nil ? 2 : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let character = presenter?.character else {
            fatalError("Could not load character data in character detail")
        }
        
        switch CharacterDetailTableViewDataSource.allCases[indexPath.row] {
        case .image:
            let cell = tableView.dequeueReusableCell(withIdentifier: CharacterDetailImageTableViewCell.cellType, for: indexPath) as! CharacterDetailImageTableViewCell
            cell.delegate = self
            cell.imageLoader = imageLoader
            cell.configure(image: character.portraitImageURL, favourite: presenter?.isFavourite ?? false)
            cell.configure(background: character.landscapeImageURL)
            return cell
            
        case .data:
            let cell = tableView.dequeueReusableCell(withIdentifier: CharacterDetailDataTableViewCell.cellType, for: indexPath) as! CharacterDetailDataTableViewCell
            cell.configure(character: character)
            return cell
        }
    }
}
