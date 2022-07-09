//
//  CharacterDetailInteractor.swift
//  Marvelpop
//
//  Created by Adrià Ros on 7/7/22.
//

import UIKit

final class CharacterDetailInteractor: CharacterDetailPresenterToInteractorProtocol {
    
    weak var presenter: CharacterDetailInteractorToPresenterProtocol?
    var characters: CharactersRepositoring?
    var favourites: FavouritesRepositoring?
    var characterID: Int?
    
    private var character: Character!
    
    func loadData() {
        characters?.getCharacterWith(id: characterID, completion: { [weak self] data, error in
            guard let character = data, error == nil else {
                guaranteeMainThread {
                    self?.presenter?.throwError()
                }
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
