//
//  FakeFavouritesCoordinator.swift
//  MarvelpopUnitTests
//
//  Created by Adrià Ros on 7/7/22.
//

import UIKit
@testable import Marvelpop

class FakeFavouritesCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController?
    
    var startCalled = false
    var pushedToCharacterDetailWithID: Int?
    
    func start() {
        startCalled = true
    }
}

extension FakeFavouritesCoordinator: FavouritesRouting {
    
    func pushToCharacterDetailWith(id: Int) {
        pushedToCharacterDetailWithID = id
    }
}
