//
//  CharacterDetailInteractor.swift
//  Marvelpop
//
//  Created by Adrià Ros on 7/7/22.
//

import UIKit

class CharacterDetailInteractor: CharacterDetailPresenterToInteractorProtocol {
    
    var presenter: CharacterDetailInteractorToPresenterProtocol?
    var characters: CharactersRepositoryProtocol?
    var favourites: FavouritesRepositoryProtocol?
    var characterID: Int?
    
    private(set) var character: Character!
    
    func loadData() {
        characters?.getCharacterWith(id: characterID, completion: { [weak self] data in
            guard let character = data else {
                return
            }
            
            guaranteeMainThread {
                self?.character = character
                self?.presenter?.didLoad(data, favourite: self?.favourites?.fetch(favourite: character) != nil)
            }
        })
    }
    
    func handleFavourite() {
        favourites?.fetch(favourite: character) != nil ? favourites?.delete(favourite: character) : favourites?.save(favourite: character)
        presenter?.isFavourite = favourites?.fetch(favourite: character) != nil
    }
}
