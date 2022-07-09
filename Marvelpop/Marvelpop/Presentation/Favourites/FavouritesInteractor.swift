//
//  FavouritesInteractor.swift
//  Marvelpop
//
//  Created by Adrià Ros on 6/7/22.
//

import UIKit

final class FavouritesInteractor: FavouritesPresenterToInteractorProtocol {
    
    weak var presenter: FavouritesInteractorToPresenterProtocol?
    var dataProvider: FavouritesRepositoring?
    
    func loadData() {
        guard let favourites = dataProvider?.fetchAll() else {
            return
        }
        
        presenter?.didLoad(favourites)
    }
    
    func deleteAll() {
        dataProvider?.deleteAll()
        guard let favourites = dataProvider?.fetchAll() else {
            return
        }
        
        presenter?.didLoad(favourites)
    }
}
