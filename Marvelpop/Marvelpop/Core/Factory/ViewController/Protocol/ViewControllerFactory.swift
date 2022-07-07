//
//  ViewControllerFactory.swift
//  Marvelpop
//
//  Created by Adrià Ros on 6/7/22.
//

import Foundation

protocol ViewControllerFactory {
    func makeTabBar() -> TabBarController
    func makeHome(coordinator: HomeRouting) -> HomeViewController
    func makeFavourites(coordinator: FavouritesRouting) -> FavouritesViewController
    func makeCharacterDetail(characterID: Int) -> CharacterDetailViewController
}
