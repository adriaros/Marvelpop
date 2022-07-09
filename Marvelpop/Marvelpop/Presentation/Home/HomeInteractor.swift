//
//  HomeInteractor.swift
//  Marvelpop
//
//  Created by Adrià Ros on 6/7/22.
//

import UIKit

final class HomeInteractor: HomePresenterToInteractorProtocol {
    
    var presenter: HomeInteractorToPresenterProtocol?
    var dataProvider: CharactersRepositoring?
    var pagination = HomeTableViewPaginationManager()
    
    private var results: [Character] = []
    
    func loadData(keyword: String?, reset: Bool) {
        
        if reset {
            pagination.reset()
            results.removeAll()
        }
        
        guard pagination.isPaginationAvailable else {
            return
        }
        
        let request = CharacterListRequest(limit: pagination.limit, offset: pagination.nextOffset, nameStartsWith: keyword)
        dataProvider?.getCharacterList(request: request) { [weak self] data, pagination, error in
            guard error == nil else {
                guaranteeMainThread {
                    self?.presenter?.throwError()
                }
                return
            }
            
            self?.results.append(contentsOf: data)
            self?.pagination.update(pagination: pagination)
            self?.presenter?.shouldShowLoadingCell = (self?.pagination.isPaginationAvailable ?? false) && data.count > 0
            
            guaranteeMainThread {
                self?.presenter?.didLoad(self?.results ?? [], total: pagination?.total)
            }
        }
    }
}
