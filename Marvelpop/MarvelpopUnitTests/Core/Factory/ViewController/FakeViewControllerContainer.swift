//
//  FakeViewControllerContainer.swift
//  MarvelpopUnitTests
//
//  Created by Adrià Ros on 6/7/22.
//

import Foundation
@testable import Marvelpop

final class FakeViewControllerContainer: ViewControllerFactory {
    
    var fakeTabBar: TabBarController!
    var fakeHome: HomeViewController!
    var fakeFavourites: FavouritesViewController!
    var fakeCharacterDetail: CharacterDetailViewController!
    
    func makeTabBar() -> TabBarController {
        fakeTabBar
    }
    
    func makeHome(coordinator: HomeRouting) -> HomeViewController {
        fakeHome
    }
    
    func makeFavourites(coordinator: FavouritesRouting) -> FavouritesViewController {
        fakeFavourites
    }
    
    func makeCharacterDetail(characterID: Int) -> CharacterDetailViewController {
        fakeCharacterDetail
    }
}
