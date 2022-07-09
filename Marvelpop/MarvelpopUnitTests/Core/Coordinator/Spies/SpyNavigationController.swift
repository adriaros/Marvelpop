//
//  SpyNavigationController.swift
//  MarvelpopUnitTests
//
//  Created by Adrià Ros on 7/7/22.
//

import UIKit

final class SpyNavigationController: UINavigationController {
    
    var pushedViewController: UIViewController?
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        pushedViewController = viewController
        super.pushViewController(viewController, animated: true)
    }
}
