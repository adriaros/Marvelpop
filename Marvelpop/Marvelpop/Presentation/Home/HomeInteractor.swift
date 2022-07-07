//
//  HomeInteractor.swift
//  Marvelpop
//
//  Created by Adrià Ros on 6/7/22.
//

import UIKit

class HomeInteractor: HomePresenterToInteractorProtocol {
    
    var presenter: HomeInteractorToPresenterProtocol?
    var dataProvider: CharactersRepositoryProtocol?
    var pagination = HomeTableViewPaginationManager()
    
    var results: [Character] = []
    
    func loadData() {
        guard pagination.isPaginationAvailable else {
            return
        }
        
        dataProvider?.getCharacterList(request: CharacterListRequest(limit: pagination.limit, offset: pagination.nextOffset)) { [weak self] data, pagination, err in
            guard err == nil else {
                guaranteeMainThread {
                    self?.presenter?.throwError()
                }
                return
            }
            
            self?.results.append(contentsOf: data)
            self?.pagination.update(pagination: pagination)
            self?.presenter?.shouldShowLoadingCell = (self?.pagination.isPaginationAvailable ?? false) && data.count > 0
            
            guaranteeMainThread {
                self?.presenter?.didLoad(self?.results ?? [])
            }
        }
    }
}
