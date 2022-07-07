//
//  AlertController.swift
//  Marvelpop
//
//  Created by Adrià Ros on 7/7/22.
//

import UIKit

struct AlertController: AlertControllerProtocol {
    
    var root: UIViewController?
    
    func show(title: String, description: String, button: String) {
        let alert = UIAlertController(title: title, message: description, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: button, style: .default, handler: nil))
        root?.present(alert, animated: true, completion: nil)
    }
}
