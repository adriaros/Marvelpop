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
    var delegate: AlertControllerDelegate?
    
    var alertTitle = ""
    var alertDescription = ""
    var alertButton = ""
    var alertActionButton = ""
    var alertCancelButton = ""
    
    func show(title: String, description: String, button: String) {
        alertTitle = title
        alertDescription = description
        alertButton = button
    }
    
    func show(title: String, description: String, action: String, cancel: String) {
        alertTitle = title
        alertDescription = description
        alertActionButton = action
        alertCancelButton = cancel
    }
}
