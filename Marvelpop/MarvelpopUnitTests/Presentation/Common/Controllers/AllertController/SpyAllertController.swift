//
//  SpyAllertController.swift
//  MarvelpopUnitTests
//
//  Created by Adrià Ros on 7/7/22.
//

import UIKit
@testable import Marvelpop

class SpyAlertController: AlertControllerProtocol {
    
    var root: UIViewController?
    
    var alertTitle = ""
    var alertDescription = ""
    var alertButton = ""
    
    func show(title: String, description: String, button: String) {
        alertTitle = title
        alertDescription = description
        alertButton = button
    }
}
