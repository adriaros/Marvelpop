//
//  CoreDataFavouriteWrapperProtocol.swift
//  Marvelpop
//
//  Created by Adrià Ros on 7/7/22.
//

import Foundation

protocol CoreDataFavouriteWrapperProtocol {
    func save(favourite: Favourite)
    func fetch(favourite: Favourite) -> Favourite?
    func fetchAll() -> [Favourite]
    func delete(favourite: Favourite)
}
