//
//  Coordinator.swift
//  Marvelpop
//
//  Created by Adrià Ros on 6/7/22.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController? { get set }
    func start()
    func addChild(_ child: Coordinator)
    func startChild(_ child: Coordinator)
}

extension Coordinator {
    
    func addChild(_ child: Coordinator) {
        childCoordinators.append(child)
    }
    
    func startChild(_ child: Coordinator) {
        addChild(child)
        child.start()
    }
}
