//
//  FavouritesInteractor.swift
//  Marvelpop
//
//  Created by Adrià Ros on 6/7/22.
//

import UIKit

class FavouritesInteractor: FavouritesPresenterToInteractorProtocol {
    
    var presenter: FavouritesInteractorToPresenterProtocol?
    var dataProvider: FavouritesRepositoryProtocol?
    
    func loadData() {
        guard let favourites = dataProvider?.fetchAll() else {
            return
        }
        
        presenter?.didLoad(favourites)
    }
}
