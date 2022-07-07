//
//  FakeHomeCoordinator.swift
//  MarvelpopUnitTests
//
//  Created by Adrià Ros on 7/7/22.
//

import UIKit
@testable import Marvelpop

class FakeHomeCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController?
    
    var startCalled = false
    var pushedToCharacterDetailWithID: Int?
    
    func start() {
        startCalled = true
    }
}

extension FakeHomeCoordinator: HomeRouting {
    
    func pushToCharacterDetailWith(id: Int) {
        pushedToCharacterDetailWithID = id
    }
}
